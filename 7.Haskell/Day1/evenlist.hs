findEven :: [Int] -> [Int]
findEven [] = []
findEven (x:xs) | mod x 2 == 0 = [x] ++ findEven xs
	| otherwise = findEven xs