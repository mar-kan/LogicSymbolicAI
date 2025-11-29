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

initialize(nim,[1,3,5,7],player).

display_game(Position,_) :-
	write(Position),
	nl.

game_over([],Player,Player).

announce(computer) :-
	write('You won! Congratulations.'),
	nl.
announce(player) :-
	write('I won!'),
	nl.

next_player(player,computer).
next_player(computer,player).

/*  Choosing moves		*/

choose_move(Position,player,Move) :-
	repeat,
	writeln('Please make a move, player!'),
	writeln('Moves are of the form "K-N.", where K is the number of a pile and N the number of counters to be taken from that pile.'),
	read(Move),
	legal(Move,Position).
choose_move(Position,computer,Move) :-
	evaluate(Position,Safety,Sum),
	decide_move(Safety,Position,Sum,Move).

legal(K-N,Position) :-
	nth1(K,Position,M),
	N =< M.

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



evaluate(Position,Safety,Sum) :-
   nim_sum(Position,[],Sum),
   safety(Sum,Safety).

safety(Sum,safe) :-
	zeros(Sum),
	!.
safety(Sum,unsafe) :-
	\+ zeros(Sum),
	!.

decide_move(safe,_,_,1-1).  % The computer's arbitrary move
decide_move(unsafe,Position,Sum,Move) :-
   safe_move(Position,Sum,Move).


/*
    nim_sum(Position,SoFar,Sum) :-
	Sum is the nim-sum of the current Position,
	and SoFar is an accumulated value.
*/
nim_sum([N|Ns],Bs,Sum) :-
	binary(N,Ds),
	nim_add(Ds,Bs,Bs1),
	nim_sum(Ns,Bs1,Sum).

nim_sum([],Sum,Sum).

nim_add(Bs,[],Bs).
nim_add([],Bs,Bs).
nim_add([B|Bs],[C|Cs],[D|Ds]) :-
	D is (B+C) mod 2,
	nim_add(Bs,Cs,Ds).

binary(1,[1]).
binary(N,[D|Ds]) :-
	N > 1,
	D is N mod 2,
	N1 is div(N,2),
	binary(N1,Ds).

decimal(Ds,N) :-
	decimal(Ds,0,1,N).
decimal([],N,_,N).
decimal([D|Ds],A,T,N) :-
	A1 is A+D*T,
	T1 is T*2,
	decimal(Ds,A1,T1,N).

zeros([]).
zeros([0|Zs]) :-
	zeros(Zs).
/*
    safe_move(Position,NimSum,Move) :-
	Move is a move from the current Position with
	the value NimSum which leaves a safe position.
*/
safe_move(Piles,NimSum,Move) :-
	safe_move(Piles,NimSum,1,Move).

safe_move([Pile|_],NimSum,K,K-M) :-
	binary(Pile,Bs),
	can_zero(Bs,NimSum,Ds,0),
	decimal(Ds,M).
safe_move([_|Piles],NimSum,K,Move) :-
	K1 is K + 1,
	safe_move(Piles,NimSum,K1,Move).

can_zero([],NimSum,[],0) :-
	zeros(NimSum).
can_zero([_|Bs],[0|NimSum],[C|Ds],C) :-
	can_zero(Bs,NimSum,Ds,C).
can_zero([B|Bs],[1|NimSum],[D|Ds],C) :-
	D is 1 - B*C,
	C1 is 1 - B,
	can_zero(Bs,NimSum,Ds,C1).