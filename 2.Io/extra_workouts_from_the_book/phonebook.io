OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
	map := Map clone
	call message arguments foreach(arg,
		map doMessage(arg)
	)
	map
)

Map atPutNumber := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1)
	)
)

file := File with("phonebook.txt") openForReading contents
phoneNumbers := doString(file)
phoneNumbers keys println
phoneNumbers values println
