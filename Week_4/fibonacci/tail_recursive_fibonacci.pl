% Tail-recursive Fibonacci nrs
fib(0,0).
fib(1,1).
fib(N,F) :-
    fib(N,0,1,F).
fib(0,N,_,N).
fib(N, P1, P2, F):-
    N > 0,
    NewP2 is P1 + P2,
    N1 is N - 1,
    fib(N1,P2,NewP2,F).

% Tail-recursive reverse and length
reverse(L,RL) :-
    reverse(L,[],RL).

reverse([H|T], Acc, L) :-
    reverse(T,[H|Acc],L).
reverse([],L,L).

myLength(List,Length) :-
    myLength(List,0,Length).

myLength([],Acc,Acc).
myLength([_|T],Acc,Length) :-
    Acc1 is Acc + 1,
    myLength(T, Acc1, Length).