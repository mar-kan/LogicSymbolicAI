%:- table minimax/6.

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
    writeln([A,B,C]),
    writeln([D,E,F]),
    writeln([G,H,I]),
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

game_over(Position,_,draw) :-
    \+member(b,Position).

announce(draw) :-
    writeln('A hard-fought draw.'),
    !.
announce(Player) :-
    computer(Player),
    writeln('I win!').
announce(Player) :-
    \+ computer(Player),
    write('You won, Player '),
    write(Player),
    writeln('! Congratulations.').

next_player(x,o).
next_player(o,x).

computer(x).

/*  Choosing moves		*/

choose_move(Position,Player,put(Player,Coordinates)) :-
    \+ computer(Player),
    repeat,
    writeln('Please make a move, player!'),
    writeln('Moves are of the form "X-Y.", where X and Y (between 1 and 3) are the column and the row to be played at respectively.'),
    read(Coordinates),
    legal(Coordinates,Position).
choose_move(Position,Player,Move) :-
    computer(Player),
    findall(M,possible_move(Player,Position,M),Moves),
    evaluate_and_choose(Player,Player,Moves,Position,max,nil-nil,Move-_).

possible_move(Player,Position,put(Player,X-Y)) :-
    between(1,3,X),
    between(1,3,Y),
    legal(X-Y,Position).

convert(X-Y,N) :-
    N is 3*(Y - 1) + X.

legal(Coordinates,Position) :-
    convert(Coordinates,N),
    nth1(N,Position,b).

move(put(Player,Coordinates),Position,Position1) :-
    convert(Coordinates,N),
    replacenth1(N,Position,Player,Position1).

/* The evaluation framework */

evaluate_and_choose(EvaluatingPlayer,CurrentPlayer,[Move|Moves],Position,MaxMin,Record,BestMove) :-
    move(Move,Position,Position1),
    next_player(CurrentPlayer,Player2),
    minimax(EvaluatingPlayer,Player2,Position1,MaxMin,_,Value),
    update(MaxMin,Move,Value,Record,Record1),
    evaluate_and_choose(EvaluatingPlayer,CurrentPlayer,Moves,Position,MaxMin,Record1,BestMove).
evaluate_and_choose(_,_,[],_,_,Record,Record).

update(_,nil,_,Move1-Value1,Move1-Value1) :-
    !.
update(_,Move,Value,nil-_,Move-Value) :-
    !.
update(max,_,Value,Move1-Value1,Move1-Value1) :-
    Value =< Value1.
update(max,Move,Value,_-Value1,Move-Value) :-
    Value > Value1.
update(min,_,Value,Move1-Value1,Move1-Value1) :-
    Value >= Value1.
update(min,Move,Value,_-Value1,Move-Value) :-
    Value < Value1.


minimax(Player,_,Position,_,_,Value) :-
    value(Player,Position,Value),
    !.
minimax(EvaluatingPlayer,CurrentPlayer,Position,MaxMin,Move,Value) :-
    findall(M,possible_move(CurrentPlayer,Position,M),Moves),
    change_max_min(MaxMin, MinMax),
    evaluate_and_choose(EvaluatingPlayer,CurrentPlayer,Moves,Position,MinMax,nil-nil,Move-Value).

change_max_min(max, min).
change_max_min(min, max).

value(Player,Position,1) :-
    game_over(Position,_,Player),
    !.
value(Player,Position,-1) :-
    next_player(Player,Player2),
    game_over(Position,_,Player2),
    !.
value(_,Position,0) :-
    game_over(Position,_,draw).

/* Utilities */
replacenth1(1,[_|Tail],New,[New|Tail]).
replacenth1(N,[Head|Tail],New,[Head|NewTail]) :-
    N > 1,
    M is N - 1,
    replacenth1(M,Tail,New,NewTail).