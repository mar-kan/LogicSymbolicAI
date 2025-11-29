
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

initialize(tictactoe,[b,b,b,b,b,b,b,b,b],x).

display_game([A,B,C,D,E,F,G,H,I],_) :-
    write([A,B,C]),
    nl,
    write([D,E,F]),
    nl,
    write([G,H,I]),
    nl,
    nl.


game_over(Position,_,x) :-
    Position = [x,x,x,_,_,_,_,_,_].
game_over(Position,_,x) :-
     Position = [_,_,_,x,x,x,_,_,_].
game_over(Position,_,x) :-
     Position = [_,_,_,_,_,_,x,x,x].

game_over(Position,_,x) :-
      Position = [x,_,_,x,_,_,x,_,_].
game_over(Position,_,x) :-
      Position = [_,x,_,_,x,_,_,x,_].
game_over(Position,_,x) :-
      Position = [_,_,x,_,_,x,_,_,x].

game_over(Position,_,x) :-
      Position = [x,_,_,_,x,_,_,_,x].
game_over(Position,_,x) :-
      Position = [_,_,x,_,x,_,x,_,_].

game_over(Position,_,o) :-
    Position = [o,o,o,_,_,_,_,_,_].
game_over(Position,_,o) :-
     Position = [_,_,_,o,o,o,_,_,_].
game_over(Position,_,o) :-
     Position = [_,_,_,_,_,_,o,o,o].

game_over(Position,_,o) :-
      Position = [o,_,_,o,_,_,o,_,_].
game_over(Position,_,o) :-
      Position = [_,o,_,_,o,_,_,o,_].
game_over(Position,_,o) :-
      Position = [_,_,o,_,_,o,_,_,o].

game_over(Position,_,o) :-
      Position = [o,_,_,_,o,_,_,_,o].
game_over(Position,_,o) :-
      Position = [_,_,o,_,o,_,o,_,_].


announce(x) :-
	write('You won, Player x! Congratulations.'),
	nl.
announce(o) :-
	write('You won, Player o! Congratulations.'),
	nl.

next_player(x,o).
next_player(o,x).

/*  Choosing moves		*/

choose_move(Position,Player,put(Player,Coordinates)) :-
	repeat,
	writeln('Please make a move, player!'),
	writeln('Moves are of the form "X-Y.", where X and Y (between 1 and 3) are the column and the row to be played at respectively.'),
	read(Coordinates),
	legal(Coordinates,Position).
convert(X-Y,N) :-
    N is 3*(Y - 1) + X.

legal(Coordinates,Position) :-
    convert(Coordinates,N),
    nth1(N,Position,b).

move(put(Player,Coordinates),Position,Position1) :-
    convert(Coordinates,N),
    replacenth1(N,Position,Player,Position1).

/* Utilities */
replacenth1(1,[_|Tail],New,[New|Tail]).
replacenth1(N,[Head|Tail],New,[Head|NewTail]) :-
    N > 1,
    M is N - 1,
    replacenth1(M,Tail,New,NewTail).