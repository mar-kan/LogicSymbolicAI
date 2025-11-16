fib(0,0).
fib(1,1).
fib(N,F) :-
    fib(N,0,1,F).
fib(0,N,_,N).
fib(N, P1, P2, F) :-
    N > 0,
    NewP2 is P1 + P2,
    N1 is N-1,
    fib(N1, P2, NewP2, F).