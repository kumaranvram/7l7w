FibonacciGenerator := Object clone

FibonacciGenerator fib := method (n, 
	if(n<=2, return 1)
	sum := 0
	first := 0
	second := 1
	for(i, 2, n, 1, (
		sum = first + second
		first = second
		second = sum
	))
	return sum
)

for(i, 1, 10, 1, (
	"Fibonacci (" print  i print  ") is " print
	FibonacciGenerator fib(i) println
))