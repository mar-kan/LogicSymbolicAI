grandmother(X,Y) :-
    mother(X,Z),
    parent(Z,Y).

grandfather(X,Y) :-
    father(X,Z),
    parent(Z,Y).

grandparent(X,Y) :-
    parent(X,Z),
    parent(Z,Y).

parent(X,Y) :-
    father(X,Y).
parent(X,Y) :-
    mother(X,Y).

ancestor(X,Y) :-
    parent(X,Y).

ancestor(X,Y) :-
    parent(X,Z),
    ancestor(Z,Y).

sibling(X,Y) :-
    father(X,Father),
    father(Y,Father),
    mother(X,Mother),
    mother(Y,Mother).

aunt_or_uncle(X,Y) :-
    sibling(X,Z),
    parent(Z,Y).

cousin(X,Y) :-
    parent(X,Z),
    aunt_or_uncle(Z,Y).