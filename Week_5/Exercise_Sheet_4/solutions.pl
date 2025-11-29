%% To take advantage of tail recursion, all recursive implementations use an accumulator internally.

deduplicate(ListIn,ListOut) :-
    deduplicate(ListIn,[],ListOut).

deduplicate([],List,List).
deduplicate([H|Tail],List,ListOut) :-
    memberchk(H,List),
    deduplicate(Tail,List,ListOut).
deduplicate([H|Tail],List,ListOut) :-
    \+ memberchk(H,List),
    append(List,H,NewList),
    deduplicate(Tail,NewList,ListOut).

triangular(N,Tri) :-
    triangular(N,0,Tri).

triangular(0,Tri,Tri).
triangular(N,Acc,Tri) :-
    N > 0,
    M is N - 1,
    AccNew is N + Acc,
    triangular(M,AccNew,Tri).

intersect_rec(In1,In2,Out) :-
  intersect_rec(In1,In2,[],Out).
intersect_rec([],_,Acc,Acc).
intersect_rec([H|Tail],List,Acc,Out) :-
    memberchk(H,List),
    intersect_rec(Tail,List,[H|Acc],Out).
intersect_rec([H|Tail],List,Acc,Out) :-
    \+ memberchk(H,List),
    intersect_rec(Tail,List,Acc,Out).

intersect_agg(In1,In2,Out) :-
    findall(X,(member(X,In1),member(X,In2)),Out).


