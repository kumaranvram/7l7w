Person := Object clone

Person greet := method( "Hello, World from Men!\n" print )

man := Person clone

"Greetings from Men\n" print
man greet

lady := Person clone

lady greet := method("We are ladies! Blah! Blah! Blah! Oh, Hi! Blah! Blah! Blah!\n" print)

"Greetings from ladies\n" print

lady greet