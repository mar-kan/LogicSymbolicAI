
initial_state(wj2(C1,C2,_),jugs(C1,C2,0,0)).

final_state(wj2(C1,C2,Goal),jugs(C1,C2,V1,_)) :-
	    Goal = V1.
final_state(wj2(C1,C2,Goal),jugs(C1,C2,_,V2)) :-
	    Goal = V2.

move(jugs(_,_,0,_),fill(1)) :-
	!.
move(jugs(_,C2,_,C2),empty(2)) :-
	!.
move(jugs(_,_,_,_),transfer(1,2)).

update(jugs(C1,C2,_,V2),fill(1),jugs(C1,C2,C1,V2)).
update(jugs(C1,C2,V1,_),empty(2),jugs(C1,C2,V1,0)).
update(jugs(C1,C2,V1,V2),transfer(1,2),jugs(C1,C2,W1,W2)) :-
	Liquid is V1 + V2,
	Excess is Liquid - C2,
	adjust(Liquid,Excess,W1,W2).

adjust(Liquid, Excess,0,Liquid) :-
	Excess =< 0.
adjust(Liquid,Excess,Excess,V) :-
	Excess > 0,
	V is Liquid - Excess.

legal(_).




