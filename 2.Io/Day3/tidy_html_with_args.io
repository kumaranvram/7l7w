OperatorTable addAssignOperator(":", "atPutPair")
TidyHTMLDocument := Object clone

TidyHTMLDocument init := method(
	self rootNode ::= nil
	return self
)

TidyHTMLDocument asString := method(
	return self printNode (rootNode, 0)
)


TidyHTMLDocument getDepthPrefix := method(depth,
	return(
		"    " repeated(depth)
	)
)

TidyHTMLDocument printNode := method(TidyHTMLElement, depth,

	buffer := list
	newLine := "\n"
	depthPrefix := self getDepthPrefix(depth)
	buffer append(
		depthPrefix,
		"<",
		TidyHTMLElement name,
		if(
			(TidyHTMLElement attributes size > 0),
			(
				attributeBuffer := list("")
				TidyHTMLElement attributes foreach(name, value,
					attributeBuffer append(
						name print
						name .. "=\"" .. value .. "\""
					)
				)
				attributeBuffer join(" ")
			),
			(
				""
			)
		),
		">",
		newLine
	)

	if(
		TidyHTMLElement text,
		buffer append(
			self getDepthPrefix(depth + 1),
			TidyHTMLElement text,
			newLine
		)
	)
	TidyHTMLElement childNodes foreach(childNode,
		buffer append(
			self printNode(childNode, (depth + 1))
		)
	)

	buffer append(
		depthPrefix,
		"</",
		TidyHTMLElement name,
		">",
		newLine
	)

	return(
		buffer join("")
	)

)

TidyHTMLAttributes := Map clone

TidyHTMLAttributes atPut := method(name, value,
	if(
		list("Sequence", "Number") contains(value type),
		super(atPut(name, value))
	)
	return(self)
)

TidyHTMLElement := Object clone

TidyHTMLElement init := method(

	self name ::= nil
	self text ::= nil
	self attributes ::= TidyHTMLAttributes clone
	self childNodes ::= list
	self parentNode ::= nil
	return(self)
)

TidyHTMLBuilder := Object clone

TidyHTMLBuilder atPutPair := method(name, value,
	attribute := Map clone
	attribute atPut("name", name asMutable removePrefix("\"") removeSuffix("\""))
	attribute atPut("value", value asMutable removePrefix("\"") removeSuffix("\""))
	return(attribute)
)

TidyHTMLBuilder curlyBrackets := method(
	attributes := list
	call message arguments foreach(attributePair,
		attributes append(
			self doString(attributePair asString)
		)

	)
	return(attributes)
)

TidyHTMLBuilder forward := method(
	missingMethodName := call message name
	missingMethodArgs := call message arguments
	TidyHTMLElement := TidyHTMLElement clone

	TidyHTMLElement setName(missingMethodName)

	if(
		self isCurlyBrackets(missingMethodArgs at(0)),
		(
			attributesMarkup := missingMethodArgs removeFirst
			attributesList := self doMessage(attributesMarkup)
			attributesList foreach(attribute,
				TidyHTMLElement attributes atPut(
					attribute at("name"),
					attribute at("value")
				)

			)
		)
	)

	missingMethodArgs foreach(argument,
		content := self doMessage(argument)
		if(
			(content type == "TidyHTMLElement"),
			(
				content setParentNode(TidyHTMLElement)
				TidyHTMLElement childNodes append(content)
			),
			(
				TidyHTMLElement setText(content)
			)
		)

	)
	return(TidyHTMLElement)
)

TidyHTMLBuilder isCurlyBrackets := method(targetMessage,
	return(
		(targetMessage asString findSeq("curlyBrackets")) == 0
	)
)


TidyHTMLBuilder parse := method(
	TidyHTMLDoc := TidyHTMLDocument clone
	TidyHTMLDoc setRootNode(
		self doMessage(
			call message arguments at(0)
		)
	)
	return(TidyHTMLDoc)
)

htmloutput := TidyHTMLBuilder parse (body(p({"class":"para-new"}, ul({"list-style": "none", "font":"Arial"}, li("Ruby"), li("Io"), li("Prolog"), li("Scala"), li("Erlang"), li("Clojure"), li("Haskell")))))

htmloutput println