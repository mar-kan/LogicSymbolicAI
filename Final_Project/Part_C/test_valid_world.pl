:- discontiguous puzzle/3.
:- discontiguous empty_space/2.
:- discontiguous monster/3.
:- discontiguous chest/1.
:- discontiguous teleport/2.
:- discontiguous barrier/1.

start(1).
finish(23).

puzzle(1,2,7).
empty_space(2,3).
empty_space(3,4).
empty_space(4,5).

empty_space(5,6).
monster(6,7,1).
chest(7).
puzzle(7,8,7).
empty_space(8,9).
empty_space(9,10).
monster(10,11,3).
monster(11,12,3).
monster(12,13,3).
empty_space(13,14).
barrier(14). % remove to have only chests reachable on foot
empty_space(14,15).

teleport(13,15).
teleport(15,13).

empty_space(15,16). % not reachable on foot
monster(16,17,1).
chest(17).

puzzle(17,18,7).
empty_space(18,19).
empty_space(19,20).
monster(20,21,3).
monster(21,22,3).
monster(22,23,3).

teleport(3,9).
teleport(9,3).


% TEST: one_start/one_finish errors
% start(2).
% finish(41).

% --- TEST illegal barriers ---

% barrier on start:
% barrier(1).

% barrier on end:
% barrier(23).

% outside spaces
% barrier(100).

% barrier on chest
% barrier(7).

% barrier on teleport:
% barrier(3).

% TEST invalid teleport
% teleport(3,10).

% TEST invalid chests
% chest(200).
% chest(16).

% TEST invalid consecutive puzzles
% puzzle(2,3,7).

% TEST unreachable finish
% finish(40).
% barrier(3).

% TEST unreachable chest
% empty_space(5,24).
% barrier(24).
% empty_space(24,25).
% chest(25).
% empty_space(25,26).
% teleport(26,9).