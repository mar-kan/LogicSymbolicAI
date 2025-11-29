% A naive computation of Fibonacci nrs
fib(0,0).
fib(1,1).
fib(N,F) :-
    N > 1,
    N1 is N-1,
    N2 is N-2,
    fib(N1,F1),
    fib(N2,F2),
    F is F1+F2.

myLength([], 0).
myLength([_|T],L) :-
	myLength(T,L1),
    L is L1+1.

reverse([],[]).
reverse([H|L],RH) :-
    reverse(L,R),
    append(R,[H],RH).

evens(0,0).
evens(N,E) :-
    M is N - 1,
    evens(M,Eold),
    E is Eold + 2.