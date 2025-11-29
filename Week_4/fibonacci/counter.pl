:- dynamic(counter/1).

fib(N,F,C) :-
    retractall(counter(_)),
    assert(counter(0)),
    hfib(N,F,C).

counter(0).
hfib(_,_,_) :-
    retract(counter(C)),
    C1 is C+1,
    assert(counter(C1)),
    fail.
hfib(0 , 0 , 1).
hfib(1 , 1 , 1).
hfib(N, F, C) :-
	N > 1,
	N1 is N-1,
	N2 is N-2,
	hfib(N1,F1,_),
	hfib(N2,F2,_),
	F is F1+F2,
	counter(C ),
	!.