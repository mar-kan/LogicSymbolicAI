% reused mymember from class
mymember(X,[X|_]).
mymember(X,[_|T]) :- mymember(X,T).

% 2. deduplicate
deduplicate([], []).
deduplicate([Header|Tail], NewTail) :-
    mymember(Header, Tail),
    !,
    deduplicate(Tail, NewTail).
deduplicate([Header|Tail], [Header|NewTail]) :-
    \+ mymember(Header, Tail),
    !,
    deduplicate(Tail, NewTail).

% 4. intersection
% recursive
intersect([], _, []).

intersect([Header1|Tail1], List2, [Header1|TailInter]) :-
    mymember(Header1, List2),
    !,
    intersect(Tail1, List2, TailInter).

intersect([Header1|Tail1], List2, TailInter) :-
    \+ mymember(Header1, List2),
    !,
    intersect(Tail1, List2, TailInter).

% aggregation using findall
intersect_agg(List1, List2, Intersection) :-
    findall(X, (member(X, List1), member(X, List2)), Intersection).
    