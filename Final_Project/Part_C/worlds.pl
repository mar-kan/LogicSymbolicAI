team(S,E) :-
    monster(S,M,_),
    monster(M,X,_),
    monster(X,E,_).
team(S,E) :-
    monster(M,E,_),
    team(S,M).

level(S,E) :-
    ordinary_level(S,E).
level(S,E) :-
    bonus_level(S,E).

ordinary_start(S,E) :-
    puzzle(S,E, _).
ordinary_start(S,E) :-
    monster(S,E,_).

% helper chain - can be empty
empty_space_chain(E,E).
empty_space_chain(S,E) :-
    empty_space(S,M),
    empty_space_chain(M,E).

ordinary_level(S,E) :-
    ordinary_start(S,M),
    empty_space_chain(M,E).

bonus_level(S,E) :-
    empty_space_chain(S,M),
    monster(M,E,1),
    chest(E).

% helper chain - can be empty
ordinary_level_chain(E,E).
ordinary_level_chain(S,E) :-
    ordinary_level(S,M),
    ordinary_level_chain(M,E).

ordinary_world(S,E) :-
    ordinary_level_chain(S,M),
    team(M,E).

% helper level chain with minimum 2 levels
level_chain(S,E) :-
    level(S,M),
    level(M,E).
level_chain(S,E) :-
    level(S,M),
    level_chain(M,E).

% helper path from start to end
path(S,S).
path(S,E) :-
    level(S,M),
    path(M,E).

% helper checks if there is a bonus level in path
bonus_in_levels(S,E) :-
    level_chain(S,E),
    bonus_level(B1,B2),
    path(S,B1),
    path(B2,E).
    %!.

bonus_world(S,E) :-
    level_chain(S,M),
    bonus_in_levels(S,M),
    team(M,E).