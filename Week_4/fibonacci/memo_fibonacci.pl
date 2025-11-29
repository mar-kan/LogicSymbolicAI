:-dynamic(memofib/2).

memofib(0,0).
memofib(1,1).
memofib(N,F) :-
    N > 1,
    N1 is N-1,
    N2 is N-2,
    memofib(N1, F1),
    memofib(N2, F2),
    F is F1+F2,
    asserta((memofib(N,F) :- ! )),
    !.