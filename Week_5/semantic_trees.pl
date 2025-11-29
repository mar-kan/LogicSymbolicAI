hterm(0).
hterm(f(X)) :- hterm(X).

pred(p(_)).
pred(q(_)).
pred(r(_)).
pred(s(_)).


%notall([p(_)]).
notall([p(f(_))]).
notall([neg(p(f(_)))]).

% Main predicates
hmod(X) :-
    hmod([],X).

hmod(Mod,Mod) :-
    \+ newhform(Mod,_),
    !.

hmod(Pmod,Mod) :-
    newhform(Pmod,X),
    consistent([X|Pmod]),
    hmod([X|Pmod],Mod).
hmod(Pmod,Mod) :-
    newhform(Pmod,X),
    consistent([neg(X)|Pmod]),
    hmod([neg(X)|Pmod],Mod).

consistent(Xs) :-
    \+ (
    notall(Ys),
    sublist(Ys,Xs)).

newhform(Pmod,X) :-
    hform(X),
    \+member(X,Pmod),
    \+member(neg(X),Pmod),
    !.

hform(F) :-
    pred(F),
    term_variables(F,Vars),
    all_hterm(Vars).

sublist([],_).
sublist([X|Xs],Ys) :-
    member(X,Ys),
    sublist(Xs,Ys).

all_hterm([]).
all_hterm([V|T]) :-
    hterm(V),
    all_hterm(T).
