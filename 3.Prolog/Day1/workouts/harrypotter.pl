:- discontiguous(wizard/1).
wizard(ron).
hasWand(harry).
quiddichPlayer(harry).

wizard(X) :- hasBroom(X), hasWand(X).
hasBroom(X) :- quiddichPlayer(X).