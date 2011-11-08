OperatorTable addAssignOperator(":", "atPutPair")

TidyHTMLBuilder := Object clone

TidyHTMLDocument := Object clone
TidyHTMLDocument tabStop := "..."
TidyHTMLElement := Object clone
TidyHTMLElementAttributes := Map clone

TidyHTMLDocument asString := method (	
	return self printNode(root, 0)
)

TidyHTMLDocument init := method (
	self root ::= nil
	return self
)

TidyHTMLDocument getIndendation := method (level,
	return tabStop repeated(level)
)

TidyHTMLDocument printNode := method (node, level,
	buffer := list()
	
	buffer append(getIndendation(level), "<", node name, node attributesAsString, ">", "\n")
	if((node text),
		buffer append(getIndendation(level + 1), node text, "\n")
	)
	
	nodes childNodes foreach(childNode
		buffer append(self printNode(childNode), level + 1)
	)
	return buffer join("")
)

TidyHTMLElementAttributes atPut := method(key, value,
	if(value type == "Sequence" or value type == "Number" ) then (super atPut(key, value); "true" print) else ("false" print)
	return self
)

TidyHTMLElement init := method(
	self key ::= nil
	self text ::= nil
	self attributes ::= TidyHTMLElementAttributes clone
	self childNodes ::= list()
	self parentNode ::= nil
	return self
)

TidyHTMLElement attributesAsString := method(
	if(self attributes size > 0),(
		buffer := list("")
		element attributes foreach(key, value,
		buffer append(key .. "=\"" .. value .. "\""))
		return buffer join(" ")
	),
	(
		return ""
	)
)

TidyHTMLBuilder atPutPair := method (key, value
	attribute := Map clone
	attribute atPut("key", key)
	attribute atPut("value", value)
	return attribute
)

TidyHTMLBuilder curlyBrackets := method(
	attributes := list()
	call message arguments foreach(attributePair,
 		attributes append(self doString(attributePair asString))
	)
	return attributes
)

TidyHTMLBuilder forward := method(
	missingMethodName := call message name
	missingMethodArgs := call message arguments
	element := TidyHTMLElement clone
	element setKey(missingMethodName)
 
	if(self isCurlyBrackets(missingMethodArgs at(0)),(
		attributesMarkup := missingMethodArgs removeFirst
		attributesList := self doMessage(attributesMarkup)
#		attributesList foreach(attribute,
#			element attributes atPut(attribute at("key"), attribute at(1))
#			return attribute
#		))
	))
	missingMethodArgs foreach( argument,
		content := self doMessage(argument)
		if((content type == "TidyHTMLElement"),(
			content setParentNode (element)
			element childNodes append(content)
		),(
			element setText(content)
		)
	))
	return element 
)

TidyHTMLBuilder isCurlyBrackets := method( targetMessage,
	return((targetMessage asString() findSeq("curlyBrackets")) == 0)
)

TidyHTMLBuilder parse := method(
	html := TidyHTMLDocument clone()
	html setRoot(
	self doMessage(call message arguments at(0)))
	return html 
)



girls := TidyHTMLBuilder parse(
 
girls(
{ type: "hotties", isActive: "true" },
 
girl(
{ id: 17 },
name( "Sarah" ),
age( 35 )
),
girl(
{ id: 104 },
name( "Joanna" ),
age( 32 )
),
girl(
{ id: 15 }
)
)
 
);
 
 

girls println();