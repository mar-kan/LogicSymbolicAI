solve_best(Problem,[state(State,Path,_)|_],_,Moves) :-
	final_state(Problem,State),
	reverse(Path,Moves).
solve_best(Problem,[state(State,Path,_)|Frontier],History,FinalPath) :-
	bagof(M,move(State,M),Moves),
	update_frontier(Problem,Moves,State,Path,History,Frontier,Frontier1),
	solve_best(Problem,Frontier1,[State|History],FinalPath).

update_frontier(Problem,[Move|Moves],State,Path,History,Frontier,Frontier1) :-
	update(State,Move,State1),
	legal(State1),
	value(Problem,State1,Value),
	insert_if_new(History,State1,Move,Path,Value,Frontier,Frontier0),
	update_frontier(Problem,Moves,State,Path,History,Frontier0,Frontier1).
update_frontier(_,[],_,_,_,Frontier,Frontier).

insert_if_new(History,State,Move,Path,Value,Frontier,Frontier0) :-
	\+memberchk(State,History),
	insert(state(State,[Move|Path],Value),Frontier,Frontier0).
insert_if_new(History,State,_,_,_,Frontier,Frontier) :-
	memberchk(State,History).

insert(State,[],[State]).
insert(State,[State1|States],[State,State1|States]) :-
	lesseq_value(State,State1).
insert(State,[State1|States],[State|States]) :-
	equals(State,State1).
insert(State,[State1|States],[State1|States1]) :-
	greater_value(State,State1), insert(State,States,States1).

equals(state(S,_,V),state(S,_,V)).

lesseq_value(state(S1,_,V1),state(S2,_,V2)) :- S1 \== S2, V1 =< V2.

greater_value(state(_,_,V1),state(_,_,V2)) :- V1 > V2.

% Testing predicate
solve_best(Problem,Moves) :-
	initial_state(Problem,State),
	value(Problem,State,Value),
	solve_best(Problem,[state(State,[],Value)],[],Moves).



%   Example for wolf-goat-cabbage:

%value(wgc(_,_,R),Val) :-
%   length(R,Val).