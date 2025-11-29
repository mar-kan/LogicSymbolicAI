/*
  solve_dfs(State,History,Moves) :-
      Moves is the sequence of moves to reach a desired final state
	from the current State, where History contains the states
	visited previously.
*/
solve_dfs(State,State,_,[]).
solve_dfs(State,Goal,History,[Move|Moves]) :-
	move(State,Move),
	update(State,Move,State1),
	legal(State1),
	\+ member(State1,History),
	solve_dfs(State1,Goal,[State1|History],Moves).

/*  Using the framework	*/

solve_dfs(Problem,Moves) :-
	initial_state(Problem,State),
	final_state(Problem,Goal),
	solve_dfs(State,Goal,[State],Moves).