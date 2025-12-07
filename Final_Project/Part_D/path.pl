path(X,Y, ToBeAvoided, [X, Y]) :-
    space(X,Y),
    \+ member(Y, ToBeAvoided).
path(X,Z, ToBeAvoided, [X|P]) :-
    space(X,Y),
    \+ member(Y, ToBeAvoided),
    path(Y,Z,[Y|ToBeAvoided], P).
path(X,Y,P) :-
    path(X,Y,[],P).

space(S,E) :- empty_space(S,E).
space(S,E) :- puzzle(S,E,_).
space(S,E) :- monster(S,E,_).