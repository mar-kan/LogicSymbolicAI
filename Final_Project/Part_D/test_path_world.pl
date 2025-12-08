:- discontiguous puzzle/3.
:- discontiguous empty_space/2.
:- discontiguous monster/3.
:- discontiguous chest/1.
:- discontiguous teleport/2.
:- discontiguous barrier/1.


start(1).
finish(20).

puzzle(1,2,7).
empty_space(2,3).
monster(3,4,1).
empty_space(4,5).
puzzle(5,6,7).
empty_space(6,7).
monster(7,8,2).
empty_space(8,9).
puzzle(9,10,7).
empty_space(10,19).
monster(19,20,3).

% branch 1
empty_space(3,11).
monster(11,12,1).
empty_space(12,13).
empty_space(13,3).

% branch 2
empty_space(5,14).
puzzle(14,15,7).
empty_space(15,16).
empty_space(16,7).

% branch 3
empty_space(7,17).
monster(17,18,3).
empty_space(18,7).


% branch 4
empty_space(2,21).
puzzle(21,22,5).
empty_space(22,23).
monster(23,24,2).
empty_space(24,6).

% extra teleports
teleport(1,9).
teleport(3,15).
teleport(14,19).

% barriers
barrier(18).
barrier(23).