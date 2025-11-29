initial_state(wj(N, Capacities, _), jugs(N, Capacities, Empties)) :-
    zeros(N, Empties).

final_state(wj(N, Capacities,Goal), jugs(N, Capacities,Jugs)) :-
    between(1,N,Jug),
    nth1(Jug,Jugs,Goal).

move(jugs(N,Cs,Jugs),fill(Jug)) :-
    between(1,N,Jug),
    nth1(Jug,Cs,C),
    nth1(Jug,Jugs,H),
    H < C.
move(jugs(N,_,Jugs),empty(Jug)) :-
    between(1,N,Jug),
    nth1(Jug,Jugs,H),
    H > 0.
move(jugs(N,_,Jugs),transfer(Jug1,Jug2)) :-
    between(1,N,Jug1),
    between(1,N,Jug2),
    Jug1 \= Jug2,
    nth1(Jug1,Jugs,H1),
    H1 > 0.

update(jugs(N,Cs,Jugs),fill(Jug),jugs(N,Cs,JugsNew)) :-
    nth1(Jug,Cs,C),
    replace_nth1(Jug,Jugs,C,JugsNew).
update(jugs(N,Cs,Jugs),empty(Jug),jugs(N,Cs,JugsNew)) :-
    replace_nth1(Jug,Jugs,0,JugsNew).
update(jugs(N,Cs,Jugs),transfer(Jug1,Jug2),jugs(N,Cs,JugsNew)) :-
    nth1(Jug1,Jugs,V1),
    nth1(Jug2,Jugs,V2),
    nth1(Jug2,Cs,C2),
    Liquid is V1 + V2,
    Excess is Liquid - C2,
    adjust(Liquid,Excess,W1,W2),
    replace_nth1(Jug1,Jugs,W1,JugsMid),
    replace_nth1(Jug2,JugsMid,W2,JugsNew).

adjust(Liquid, Excess, 0, Liquid) :- Excess =< 0.
adjust(Liquid, Excess, Excess, V) :- Excess > 0, V is Liquid - Excess.

legal(_).

zeros(0,[]).
zeros(N,[0|Zs]) :-
    N>0,
    M is N-1,
    zeros(M,Zs).

replace_nth1(N,L1,C,L2) :-
    replace_nth1(N,L1,C,[],L2).
replace_nth1(1,[_|Tail],C,Acc,L2) :-
    append(Acc,[C|Tail],L2).

replace_nth1(N,[Head|Tail],C,Acc,L2) :-
    N>1,
    M is N-1,
    replace_nth1(M,Tail,C,[Head|Acc],L2).