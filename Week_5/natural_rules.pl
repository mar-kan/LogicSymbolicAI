:- op(900, xfx, <--).
:- dynamic(natural/1).
:- dynamic(addition/3).
:- discontiguous (<--)/2.

natural(0).
natural(s(N)) <-- [natural(N)].

addition(A,0,A).
addition(A,s(B),s(C)) <--
    [addition(A,B,C)].
