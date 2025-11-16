path(X,Y, ToBeAvoided, [X, Y]) :-
    edge(X,Y),
    \+ member(Y, ToBeAvoided).

path(X,Z, ToBeAvoided, [X|P]) :-
    edge(X,Y),
    \+ member(Y, ToBeAvoided),
    path(Y,Z,[Y|ToBeAvoided], P).
path(X,Y,P) :-
    path(X,Y,[],P).

edge(1,2).
edge(2,3).
edge(3,1).

edge(2,5).
edge(5,5).
edge(5,4).