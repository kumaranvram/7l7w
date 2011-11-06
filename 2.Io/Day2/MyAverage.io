List myAverage := method (
	if((self size == 0),
		Exception raise ("List Empty", "Cannot compute average on an empty list")
	)
	self foreach (index, value,
		if((value type != "Number"),
			Exception raise ("NaN", "Average cannot be calculated on a list with non numeric value")
		)
	)
	return self average
)


list (1, 5, 6) myAverage print
list (1, "abc") myAverage print
list () myAverage print