the(0,1).
slithy(1,2).
toves(2,3).
did(3,4).
gimble(4,5).

determiner(X,Y) :- the(X,Y).
adjective(X,Y) :- slithy(X,Y).
noun(X,Y) :- toves(X,Y).
auxiliary(X,Y) :- did(X,Y).
verb(X,Y) :- gimble(X,Y).

sentence(X,Z) :-
    nounphrase(X,Y),
    verbphrase(Y,Z).

nounphrase(W,Z) :-
    determiner(W,X),
    adjective(X,Y),
    noun(Y,Z).

verbphrase(X,Z) :-
    auxiliary(X,Y),
    verb(Y,Z).