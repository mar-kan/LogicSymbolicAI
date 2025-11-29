natural(0).
natural(s(N)) :- natural(N).

addition(A,0,A).
addition(A,s(B),s(C)) :-
    addition(A,B,C).

