# Valid world test log

## Test valid world:

    start(1).
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
    barrier(14).
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

    finish(23).

### Testing first that criteria work with normal Prolog:

1. As is, it returns true as intended.
2. Invalid starts and finishes tests: 
    - start(1) with start(2) 
    - finish(23) with finish(41)
    - no start
    - no finish

3. Illegal barriers tests:
    - barrier on start: barrier(1)
    - barrier on end: barrier(23)
    - barrier outside spaces: barrier(100)
    - barrier on chest: barrier(7)
    - barrier on teleport: barrier(3)
    
4. I tested illegral teleports by trying to teleport to a non-teleport square: teleport(3,10)
 
5. Illegal chests tests:
    - chest outside area: chest(100)
    - chest on empty space: chest(16)
6. Consecutive puzzles test: 
    Replaced empty_space(2,3) with puzzle(2,3,7)
7. Unreachable finish tests:
    - finish without any path: replaced finish(23) with finish(40)
    - no path: added barrier(3)

8. Tested unreachable chests by adding another path with the chest blocked by a barrier:

        empty_space(5,24).
        barrier(24).
        empty_space(24,25).
        chest(25).
        empty_space(25,26).
        teleport(26,9).

9. Tested bonus world by removing one monster from the end.

10. Tested at least one bonus level with chest unreachable on foot by making chest reachable by removing barrier(14) and the teleports for 13,15.

All these tests returned false as expected.

## Experiments with different executions

### Normal prolog execution:

#### Query valid_world(1,23):

    [1] 3 ?- time(valid_world(1,23)).
    % 72,623,797 inferences, 2.672 CPU in 2.714 seconds (98% CPU, 27180836 Lips)
    true ;
    % 307 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 104 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 104 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 104 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 101 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 497 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 306 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 104 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 104 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true
    ...

#### Free query valid_world(S,E):
    [3] 4 ?- time(valid_world(S,E)). 
    % 4,809,443 inferences, 0.156 CPU in 0.176 seconds (89% CPU, 30780435 Lips)
    S = 16,
    E = 23 ;
    % 306 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 16,
    E = 23 ;
    % 104 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 16,
    E = 23 ;
    % 104 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 16,
    E = 23 ;
    % 104 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 16,
    E = 23 ;
    ...

Comment: It is certainly not an optimal solution for the free query as it keeps finding the same solution without moving on to the next solutions.

### Backward execution:

For the backward executions, I get false for worlds I get true in the normal execution.




