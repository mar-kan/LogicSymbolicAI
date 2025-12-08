path_hp(X,Y,ToBeAvoided,[X,Y],_,_) :-
    empty_space(X,Y),
    \+ barrier(X),
    \+ barrier(Y),
    \+ member(Y,ToBeAvoided).
path_hp(X,Y,ToBeAvoided,[X,Y],_,_) :-
    teleport(X,Y),
    \+ barrier(X),
    \+ barrier(Y),
    \+ member(Y,ToBeAvoided).
path_hp(X,Y,ToBeAvoided,[X,Y],HP,HP) :-
    puzzle(X,Y,L),
    \+ barrier(X),
    \+ barrier(Y),
    HP >= L,
    \+ member(Y,ToBeAvoided).
path_hp(X,Y,ToBeAvoided,[X,Y],HP,HPout) :-
    monster(X,Y,L),
    \+ barrier(X),
    \+ barrier(Y),
    HP > L, % don't drop below 1
    \+ member(Y,ToBeAvoided),
    HPout is HP - L.

path_hp(X,Z,ToBeAvoided,[X|P],HP,HPout) :-
    empty_space(X,Y),
    \+ barrier(Y),
    \+ member(Y,ToBeAvoided),
    path_hp(Y,Z,[Y|ToBeAvoided],P,HP,HPout).
path_hp(X,Z,ToBeAvoided,[X|P],HP,HPout) :-
    teleport(X,Y),
    \+ barrier(Y),
    \+ member(Y,ToBeAvoided),
    path_hp(Y,Z,[Y|ToBeAvoided],P,HP,HPout).
path_hp(X,Z,ToBeAvoided,[X|P],HP,HPout) :-
    puzzle(X,Y,L),
    \+ barrier(Y),
    HP >= L,
    \+ member(Y,ToBeAvoided),
    path_hp(Y,Z,[Y|ToBeAvoided],P,HP,HPout).
path_hp(X,Z,ToBeAvoided,[X|P],HP,HPout) :-
    monster(X,Y,L),
    \+ barrier(Y),
    HP > L,
    \+ member(Y,ToBeAvoided),
    HPnew is HP - L,
    path_hp(Y,Z,[Y|ToBeAvoided],P,HPnew,HPout).

path_hp(X,Y,P,HPin,HPout) :-
    path_hp(X,Y,[],P,HPin,HPout).
