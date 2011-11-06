List2D := List clone

List2D dim := method(x, y, 
	self setSize(x)
	for(i, 0, y-1,
		self atPut(i, (list setSize(y)))
	)
	return self
)

List2D get := method (x, y,
	return self at(x) at (y)
)

List2D put := method (x, y, val,
	self at (x) atPut(y, val)
)

myList := List2D clone
myList dim(2, 2)
myList put(1, 1, 10)
myList get(1, 1) print


