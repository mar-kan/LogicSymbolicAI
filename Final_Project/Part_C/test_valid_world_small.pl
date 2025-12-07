:- discontiguous puzzle/3.
:- discontiguous empty_space/2.
:- discontiguous monster/3.
:- discontiguous chest/1.
:- discontiguous teleport/2.
:- discontiguous barrier/1.

start(1).
finish(7).

puzzle(1,2,7).
empty_space(2,3).

monster(3,4,1).
chest(4).

teleport(3,8).
teleport(8,3).

monster(8,9,1).
chest(9).

% team at the very end

monster(4,5,3).
monster(5,6,3).
monster(6,7,3).

empty_space(10,11).
barrier(11).
empty_space(11,12).