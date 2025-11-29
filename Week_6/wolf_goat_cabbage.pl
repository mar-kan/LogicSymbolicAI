:- use_module(library(ordsets)).

initial_state(wgc, wgc(left, [cabbage, goat, wolf], [])).

final_state(wgc, wgc(right, [], [cabbage, goat, wolf])).

move(wgc(left, L, _), Cargo) :-
    member(Cargo, L).
move(wgc(right, _, R), Cargo) :-
    member(Cargo, R).
move(wgc(_, _, _), alone).

update(wgc(B,L,R), Cargo,wgc(B1,L1,R1)) :-
    update_boat(B,B1),
    update_banks(Cargo,B,L,R,L1,R1).

update_boat(left,right).
update_boat(right,left).

update_banks(alone,_,L,R,L,R).
update_banks(Cargo,left,L,R,L1,R1) :-
    ord_del_element(L,Cargo,L1),
    ord_add_element(R,Cargo,R1).
update_banks(Cargo,right,L,R,L1,R1) :-
    ord_del_element(R,Cargo,R1),
    ord_add_element(L,Cargo,L1).

legal(wgc(left,_,R)) :- \+ illegal(R).
legal(wgc(right,L,_)) :- \+ illegal(L).

illegal(Bank) :-
    ord_memberchk(wolf, Bank),
    ord_memberchk(goat, Bank).
illegal(Bank) :-
    ord_memberchk(goat, Bank),
    ord_memberchk(cabbage, Bank).
