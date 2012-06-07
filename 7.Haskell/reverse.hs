reverselist [] = []
reverselist (x:xs) = reverselist xs ++ [x]