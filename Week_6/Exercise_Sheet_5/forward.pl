% Inspired by
% Knut Hinkelmann:
% "Forward Logic Evaluation: Developing a Compiler from a Partially Evaluated Meta Interpreter."
% DFKI, DFKI Technical Memos (TM), Vol. 91-13, 1991.

:- dynamic(derived/1).
:- op(900, xfx, <--).

% Depth-first reasoning

df_enum([X|_],Conclusion) :-
    df_enum(X,Conclusion).

df_enum([_|Xs],Conclusion) :-
    df_enum(Xs,Conclusion).

df_enum(Fact, Inference) :-
    \+ is_list(Fact),
    call(Fact),
    df_one(Fact,Inference).

df_one(Fact,Inference) :-
    forward_df(Fact,Conclusion),
    df_one_more(Conclusion,Inference).

df_one_more(Conclusion,Conclusion).
df_one_more(Conclusion,Next) :-
    df_one(Conclusion,Next).

forward_df(Fact,Head) :-
    Head <-- Body,
    trigger(Fact, Body,ToProve),
    provelist(ToProve),
    retain_df(Head).

retain_df(Conclusion) :-
    \+ call(Conclusion),
    asserta(Conclusion).

% Breadth-first reasoning
bf_enum(List,Conclusion)  :-
    nonvar(Conclusion),
    !,
    bf_enum(List,C),
    C = Conclusion.

bf_enum([],Conclusion) :-
    bagof(F,derived(F),Level),
    assert_all(Level),
    retractall(derived(_)),
    bf_enum(Level,Conclusion).
bf_enum([X|_],Conclusion) :-
    bf_enum_aux(X,Conclusion).
 %   append([X|Xs],[Inference],List),
bf_enum([_|Xs],Conclusion) :-
    bf_enum(Xs,Conclusion).

%bf_enum_check(Fact,_,Fact).
%bf_enum_check(_,List,Conclusion) :-
%    bf_enum(List,Conclusion).

bf_enum_aux(Fact, Inference) :-
%   retractall(open_node(_)),
   call(Fact),
   forward_bf(Fact, Inference).

forward_bf(Fact,Head) :-
    Head <-- Body,
    trigger(Fact, Body,ToProve),
    provelist(ToProve),
    retain_bf(Head).

retain_bf(Conclusion) :-
    \+ call(Conclusion),
    \+ call(derived(Conclusion)),
    assertz(derived(Conclusion)).

% Utilities

trigger(Fact,[Fact|Prem],Prem).
trigger(Fact,[P|Prem], [P|ToProve]) :-
    trigger(Fact,Prem, ToProve).

provelist([]).
provelist([First|Rest]) :-
    call(First),
    provelist(Rest).

assert_all([]).
assert_all([X|Xs]) :-
    assert(X),
    assert_all(Xs).