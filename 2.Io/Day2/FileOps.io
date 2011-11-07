
FileAccessor := Object clone

FileAccessor writeMatrixToFile := method(matrix,
	matrixFile := File open("matrix.iodat")
	matrixFile write(matrix serialized)
	matrixFile close
)

FileAccessor readMatrixFromFile := method (
	matrix := doFile("matrix.iodat")
	
	return matrix 
)

FileAccessor writeMatrixToFile(list(1, 2, 23, 45, 56))
FileAccessor readMatrixFromFile println