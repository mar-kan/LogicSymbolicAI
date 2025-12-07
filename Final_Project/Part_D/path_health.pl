path_hp(X,Y,ToBeAvoided,[X,Y],_,_) :-
    empty_space(X,Y),
    \+ member(Y,ToBeAvoided).
path_hp(X,Y,ToBeAvoided,[X,Y],HP,HP) :-
    puzzle(X,Y,L),
    HP >= L,
    \+ member(Y,ToBeAvoided).
path_hp(X,Y,ToBeAvoided,[X,Y],HP,HPout) :-
    monster(X,Y,L),
    HP > L, % don't drop below 1
    \+ member(Y,ToBeAvoided),
    HPout is HP - L.

path_hp(X,Z,ToBeAvoided,[X|P],HP,HPout) :-
    empty_space(X,Y),
    \+ member(Y,ToBeAvoided),
    path_hp(Y,Z,[Y|ToBeAvoided],P,HP,HPout).
path_hp(X,Z,ToBeAvoided,[X|P],HP,HPout) :-
    puzzle(X,Y,L),
    HP >= L,
    \+ member(Y,ToBeAvoided),
    path_hp(Y,Z,[Y|ToBeAvoided],P,HP,HPout).
path_hp(X,Z,ToBeAvoided,[X|P],HP,HPout) :-
    monster(X,Y,L),
    HP > L,
    \+ member(Y,ToBeAvoided),
    HPnew is HP - L,
    path_hp(Y,Z,[Y|ToBeAvoided],P,HPnew,HPout).

path_hp(X,Y,P,HP) :-
    path_hp(X,Y,[],P,HP,_).
path_hp(X,Y,P,HPin,HPout) :-
    path_hp(X,Y,[],P,HPin,HPout).

space(S,E) :- empty_space(S,E).
space(S,E) :- puzzle(S,E,_).
space(S,E) :- monster(S,E,_).