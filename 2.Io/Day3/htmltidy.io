TidyHTMLBuilder := Object clone

TidyHTMLBuilder tabsRequired := 0
TidyHTMLBuilder tabStop := "   "

TidyHTMLBuilder getPrefixForTabs := method(numberOfTabs,
	return tabStop repeated(numberOfTabs)
)

TidyHTMLBuilder forward := method (
	tabSpaces := getPrefixForTabs(tabsRequired)
	writeln (tabSpaces, "<", call message name, ">")
	tabsRequired = tabsRequired + 1;
	call message arguments foreach(arg,
		content := self doMessage(arg);
		if(content type == "Sequence",  writeln(getPrefixForTabs(tabsRequired), tabStop, content))
	)
	tabsRequired = tabsRequired - 1;
	writeln(tabSpaces, "</", call message name, ">")
)


TidyHTMLBuilder body(p(ul(li("Ruby"), li("Io"), li("Prolog"), li("Scala"), li("Erlang"), li("Clojure"), li("Haskell"))))