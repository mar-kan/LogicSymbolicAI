
/*   The play framework	   */

play(Game) :-
	initialize(Game,Position,Player),
	display_game(Position,Player),
	play(Position,Player,_).

play(Position,Player,Result) :-
	game_over(Position,Player,Result),
	!,
	announce(Result).
play(Position,Player,Result) :-
	choose_move(Position,Player,Move),
	move(Move,Position,Position1),
	display_game(Position1,Player),
	next_player(Player,Player1),
	!,
	play(Position1,Player1,Result).

/*  Filling in the game-playing framework	*/

initialize(nim,[1,3,5,7],player1).

display_game(Position,_) :-
	write(Position),
	nl.

game_over([],Player,Player2) :-
	next_player(Player2,Player).

announce(player1) :-
	write('You won, Player 1! Congratulations.'),
	nl.
announce(player2) :-
	write('You won, Player 2! Congratulations.'),
	nl.

/*
	move(Move,Position,Position1) :-
	Position1 is the result of executing the move Move
	from the current Position.
*/
move(K-M,[N|Ns],[N|Ns1]) :-
	K > 1,
	K1 is K - 1,
	move(K1-M,Ns,Ns1).
move(1-N,[N|Ns],Ns).
move(1-M,[N|Ns],[N1|Ns]) :-
	N > M,
	N1 is N - M.

next_player(player1,player2).
next_player(player2,player1).

/*  Choosing moves		*/

choose_move(Position,player1,Move) :-
	repeat,
	writeln('Please make a move, Player 1!'),
	writeln('Moves are of the form "K-N.", where K is the number of a pile and N the number of counters to be taken from that pile.'),
	read(Move),
	legal(Move,Position).
choose_move(Position,player2,Move) :-
	repeat,
	writeln('Please make a move, Player 2!'),
	writeln('Moves are of the form "K-N.", where K is the number of a pile and N the number of counters to be taken from that pile.'),
	read(Move),
	legal(Move,Position).

legal(K-N,Position) :-
	nth1(K,Position,M),
	N =< M.