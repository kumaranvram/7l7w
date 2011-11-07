generated := (((Random() value * 100) floor ) % 100) + 1
flag := false
10 repeat(
	guess := File standardInput readLine asNumber
	
	if((guess == generated),
		"Bull's Eye!" println
		flag := true
		break
	)
	
	if(guess < generated) then ("Get hotter dude!" println) else ("Chill out, mate!" println)
	
)

if (flag) then("Good try amigo!" println) else ("Better luck next time. Go cry to your mama!" println)