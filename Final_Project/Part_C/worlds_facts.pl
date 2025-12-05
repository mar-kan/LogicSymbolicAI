:-discontiguous chest/1.
:-discontiguous barrier/1.


space(S,E) :-
    empty_space(S,E).
space(S,E,L) :-
    puzzle(S,E,L).
space(S,E,L) :-
    monster(S,E,L).

barrier(B) :-
    empty_space(_, B),
    empty_space(B, _),
    \+ start(B),
    \+ finish(B),
    \+ chest(B),
    \+ teleport(B,_).

chest(C) :-
    puzzle(_,C,_).
chest(C) :-
    monster(_,C,_).

% no 2 consecutive puzzles

empty_space(1,2). 
empty_space(2,3). 
empty_space(3,4). 
puzzle(4,5,7).  
monster(5,6,1).

start(1). 
finish(6). 
chest(6). 
barrier(3). 
teleport(2,4). 
teleport(4,2).