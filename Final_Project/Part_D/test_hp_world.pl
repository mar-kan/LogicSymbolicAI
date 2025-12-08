:-discontiguous puzzle/3.
:-discontiguous monster/3.
:-discontiguous empty_space/2.
:-discontiguous chest/1.
:-discontiguous teleport/2.


start(1).
finish(20).

empty_space(1,2).
puzzle(2,3,3).
monster(3,4,2).
empty_space(4,5).
monster(5,6,4).
empty_space(6,10).
puzzle(10,11,5).
empty_space(11,19).
monster(19,20,3).

% branch 1
empty_space(3,7).
puzzle(7,8,2).
monster(8,4,1).

% branch 2
empty_space(4,12).
puzzle(12,13,3).
empty_space(13,6).

% branch 3
monster(4,14,5).
empty_space(14,6).

% branch 4
empty_space(6,15).
monster(15,16,2).
puzzle(16,17,4).
empty_space(17,10).

% branch 5
empty_space(11,18).
monster(18,20,6).

% teleports
teleport(1,5).
teleport(2,12).
teleport(7,13).
teleport(15,11).

% barriers
barrier(14).
barrier(16).