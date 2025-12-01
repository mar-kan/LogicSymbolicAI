:- op(900, xfx, <--).

team(S,E) <-- [monster(S,M,_), monster(M,X,_), monster(X,E,_)].
team(S,E) <-- [team(S,M), monster(M,E,_)].

level(S,E,L) <-- [ordinary_level(S,E,L)].
level(S,E,L) <-- [bonus_level(S,E,L)].

ordinary_level(S,E,L) <-- [puzzle(S,E,L)].
ordinary_level(S,E,L) <-- [monster(S,E,L)].
ordinary_level(S,E,L) <-- [ordinary_level(S,M,L), empty_space(M,E)].

bonus_level(S,E,L) <-- [monster(S,E,L), chest(E)].
bonus_level(S,E,L) <-- [empty_space(S,M), bonus_leve(M,E,L)].

ordinary_world(S,E) <-- [ordinary_level(S,M,_), team(M,E)].
ordinary_world(S,E) <-- [ordinary_level(S,M,_), ordinary_world(M,E)].

bonus_world(S,E) <-- [bonus_level(S,M,_), level(M,X,_), team(X,E)].
bonus_world(S,E) <-- [level(S,M,_), bonus_level(M,X,_), team(X,E)].
bonus_world(S,E) <-- [level(S,M,_), bonus_world(M,E)].