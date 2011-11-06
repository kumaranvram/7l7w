Number setSlot (
	"divide",
	Number getSlot("/")
)


Number setSlot( "/", method (denominator, 
	if((denominator == 0),
		return "NaN"
	)
	return divide(denominator))
)

(9 / 3) println
(9 / 0) println
