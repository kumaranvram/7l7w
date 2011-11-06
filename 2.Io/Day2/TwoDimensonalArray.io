ArrayCalc := Object clone

List sum2 := method (array,
	sum := 0
	for(i, 0, array size-1, i
			sum = sum + array at(i) sum
	)
	return sum
)

arr := list(
	list(1, 2, 3),
	list(4, 5, 6),
	list(7, 8, 9, 10)
)

"Sum of the 2D array is " print
ArrayCalc sumup(arr) println