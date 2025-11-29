path(X,Y) :- edge(X,Y).
path(X,Z) :- edge(X,Y), path(Y,Z).

edge(1,2).
edge(2,3).
edge(3,1).

edge(2,5).
edge(5,5).
edge(5,4).
