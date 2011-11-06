FibonacciGenerator := Object clone

FibonacciGenerator fib := method (n, 
	if(( n<= 2),
		return 1
	);
	recursive := method(n, i, first, second,
		if((i == n),
			return (first + second)
		)
		return recursive (n, i+1, second, (first+second))
	);
	return recursive(n, 2, 0, 1)
)

for(i, 1, 10, 1, (
	"Fibonacci (" print  i print  ") is " print
	FibonacciGenerator fib(i) println
))