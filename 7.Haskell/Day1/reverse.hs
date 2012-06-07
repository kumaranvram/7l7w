reverselist :: [a] -> [a]
reverselist [] = []
reverselist (x:xs) = reverselist xs ++ [x]