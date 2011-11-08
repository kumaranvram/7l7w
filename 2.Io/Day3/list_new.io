curlyBrackets := method(
	list := call message arguments map(arg,
		self doMessage(arg)
	)
	return(list);
);

list := {"Kumaran", "Senthil", "Pralay", "Mario"}
list println