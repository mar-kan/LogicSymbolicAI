:-discontiguous puzzle/3.
:-discontiguous monster/3.
:-discontiguous empty_space/2.
:-discontiguous chest/1.

%--- test team ---

% empty_space(1,2).
% monster(2,3,1).
% monster(3,4,2).
% monster(4,5,1).
% monster(5,6,3).
% monster(6,7,1).
% monster(7,8,8).
% empty_space(8,9).
% monster(9,10,10).
% monster(10,11,11).
% monster(11,12,1).
% monster(12,13,5).

%--- test ordinary_level ---

% empty_space(1,2).
% monster(2,3,1).
% empty_space(3,4).
% empty_space(4,5).
% puzzle(5,6,7).
% empty_space(6,7).
% empty_space(7,8).
% empty_space(8,9).
% empty_space(9,10).
% empty_space(10,11).
% empty_space(11,12).
% empty_space(12,13).
% empty_space(13,14).

%--- test ordinary_world ---

% empty_space(1,2).
% monster(2,3,1).
% empty_space(3,4).
% empty_space(4,5).
% puzzle(5,6,7).
% empty_space(6,7).
% empty_space(7,8).
% empty_space(8,9).
% empty_space(9,10).
% empty_space(10,11).
% empty_space(11,12).
% empty_space(12,13).
% empty_space(13,14).
% puzzle(14,15,7).
% empty_space(15,16).
% empty_space(16,17).
% monster(17,18,1).
% monster(18,19,1).
% monster(19,20,1).
% puzzle(20,21,7).
% puzzle(21,22,7).

%--- test bonus_level ---

% empty_space(1,2).
% empty_space(2,3).
% empty_space(3,4).
% empty_space(4,5).
% empty_space(5,6).
% empty_space(6,7).
% empty_space(7,8).
% empty_space(8,9).
% empty_space(9,10).
% empty_space(10,11).
% empty_space(11,12).
% empty_space(12,13).
% empty_space(13,14).
% empty_space(14,15).
% empty_space(15,16).
% empty_space(16,17).
% empty_space(17,18).
% empty_space(18,19).
% empty_space(19,20).
% monster(20,21,1).
% chest(21).
% empty_space(21,22).
% empty_space(22,23).
% monster(23,24,2).
% chest(24).

%--- test bonus_world ---

% puzzle(1,2,7).
% empty_space(2,3).
% empty_space(3,4).
% empty_space(4,5).

% empty_space(5,6).
% empty_space(6,7).
% empty_space(7,8).
% empty_space(8,9).
% monster(9,10,1).
% chest(10).

% puzzle(10,11,7).
% empty_space(11,12).
% empty_space(12,13).

% monster(13,14,2).
% chest(14).
% empty_space(14,15).

% puzzle(15,16,7).
% empty_space(16,17).
% empty_space(17,18).

% monster(18,19,3).
% monster(19,20,3).
% monster(20,21,3).
% monster(21,22,3).

% --- small bonus world ---
puzzle(1,2,7).
empty_space(2,3).
empty_space(3,4).

monster(4,5,1).
chest(5).

puzzle(5,6,7).
empty_space(6,7).

monster(7,8,3).
monster(8,9,3).
monster(9,10,3).