HTMLBuilder := Object clone

HTMLBuilder forward := method (
	writeln ("<", call message name, ">")
	call message arguments foreach(arg,
		content := self doMessage(arg);
		if(content type == "Sequence", writeln(content))
	)
	writeln("</", call message name, ">")
)


HTMLBuilder body(p(ul(li("Ruby"), li("Io"), li("Prolog"), li("Scala"), li("Erlang"), li("Clojure"), li("Haskell"))))