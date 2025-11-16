path(X,Y) :-
    edge(X,Y).

path(X,Z) :-
path(X,Y),
path(Y,Z).

edge(a,b).
edge(b,c).
