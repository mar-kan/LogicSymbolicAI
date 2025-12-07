space(S,E) :-
    empty_space(S,E).
space(S,E) :-
    puzzle(S,E,_).
space(S,E) :-
    monster(S,E,_).

% barriers between empty spaces and never occurs with start, finish, chest or teleport
no_illegal_barriers :-
    \+ ( barrier(B),
         ( \+ empty_space(_,B)
         ; \+ empty_space(B,_)
         ; start(B)
         ; finish(B)
         ; chest(B)
         ; teleport(B,_)
         ; teleport(_,B)
         )
       ).

% exactly one start
one_start :-
    findall(S, start(S), Ss),
    length(Ss,1).

% exactly one finish
one_finish :-
    findall(F, finish(F), Fs),
    length(Fs,1).

% can teleport only on other teleport
all_teleports_valid :-
    \+ ( teleport(_,Y),
         \+ teleport(Y,_) ).

% treasure chests are located at the end of puzzles or monsters
all_chests_valid :-
    \+ ( chest(C),
         \+ ( puzzle(_,C,_)
            ; monster(_,C,_)
            )
       ).

% no 2 consecutive puzzles
no_consecutive_puzzles :-
    \+ ( puzzle(_,E,_),
         puzzle(E,_,_) ).
        
% --- reachable ---

reachable_foot(P) :-
    start(S),
    reachable_foot_path(S,P).

reachable_foot_path(S,S) :-
    \+ barrier(S).
reachable_foot_path(S,P) :-
    space(S,M),
    \+ barrier(M),
    reachable_foot_path(M,P).

reachable(P) :-
    start(S),
    reachable_path(S,P).

reachable_path(S,S) :-
    \+ barrier(S).
reachable_path(S,P) :-
    space(S,M),
    \+ barrier(M),
    reachable_path(M,P).    
reachable_path(S,P) :-
    space(S,T1),
    teleport(T1,T2),
    reachable_path(T2,P).

valid_world(S,E) :-
    bonus_world(S,E),
    no_illegal_barriers,
    one_start,
    one_finish,
    all_teleports_valid,
    all_chests_valid,
    no_consecutive_puzzles,
    finish(E),
    reachable(E),
    \+ ( chest(C),
         \+ reachable(C)
       ),
    bonus_level(_,BC),
    chest(BC),
    \+ reachable_foot(BC).