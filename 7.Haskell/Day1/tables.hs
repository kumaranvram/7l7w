tables :: Int -> [(Int, Int, Int)]
tables x = [(a, b, a * b) | a <- [1..x], b <- [1..x]]