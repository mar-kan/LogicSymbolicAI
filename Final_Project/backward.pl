:- op(900, xfx, <--).

:- use_module(library(lists),[append/3,member/2]).
% Simple "vanilla" depth-first metainterpreter

df_backward(Goal) :-
    cl(Goal,Body),
    df_backward_body(Body).

df_backward_body([]).
df_backward_body([A|B]) :-
    df_backward(A),
    df_backward_body(B).

% Breadth-first backward meta-interpreter; approach adapted from Simply Logical

bf_backward(Goal):-
    bf_backward_a([a([Goal],Goal)],Goal).

bf_backward_a([a([],Goal)|_Agenda],Goal).
bf_backward_a([a([],_)|Agenda],Goal) :-
    bf_backward_a(Agenda,Goal).

bf_backward_a([a([A|B],G)|Agenda],Goal):-
    findall(a(D,G),
            (cl(A,C), append(C,B,D)),
            Children),
    append(Agenda,Children,NewAgenda),  % breadth-first
    bf_backward_a(NewAgenda,Goal).

cl(A,[]) :-
    call(A).
cl(A,C) :-
    A <-- C.

