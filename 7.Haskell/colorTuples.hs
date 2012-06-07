generateTuples [] = []
generateTuples xs = [(head xs, y) | y <- xs] ++ generateTuples (tail xs)