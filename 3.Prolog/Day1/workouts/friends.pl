likes(kumaran, books).
likes(senthil, computers).
likes(kumaran, computers).
likes(bookworm, books).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).