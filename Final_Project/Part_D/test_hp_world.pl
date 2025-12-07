:-discontiguous puzzle/3.
:-discontiguous monster/3.
:-discontiguous empty_space/2.
:-discontiguous chest/1.


start(1).
finish(12).

% main
empty_space(1,2).
empty_space(2,3).
empty_space(3,4).
empty_space(4,5).
empty_space(5,6).
empty_space(6,12).

% branch
puzzle(2,7,2).
empty_space(7,8).
puzzle(8,9,4).
monster(9,6,1).

% branch
monster(3,10,5).
empty_space(10,11).
monster(11,6,2).

% loop
empty_space(4,13).
monster(13,4,1).