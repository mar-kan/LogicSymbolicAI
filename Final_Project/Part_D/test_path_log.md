# Test log of path.pl and path_health

## 1. Path

### Test world:

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

### Test query:

    [1] 4 ?- path(1,20, Path).
    Path = [1, 2, 3, 4, 5, 14, 15, 16, 7|...] ;
    Path = [1, 2, 3, 4, 5, 14, 19, 20] ;
    Path = [1, 2, 3, 4, 5, 6, 7, 8, 9|...] ;
    Path = [1, 2, 3, 15, 16, 7, 8, 9, 10|...] ;
    Path = [1, 9, 10, 19, 20] ;
    false.

## 2. Path with health

### Test world:

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

### Tests performed:

    [2] 18 ?- path_hp(1,10,Path,20,HPout).  
    Path = [1, 2, 12, 13, 6, 10] ;
    Path = [1, 2, 3, 7, 13, 6, 10] ;
    Path = [1, 2, 3, 7, 8, 4, 5, 6, 10] ;
    Path = [1, 2, 3, 7, 8, 4, 12, 13, 6|...] ;
    Path = [1, 2, 3, 4, 5, 6, 10] ;
    Path = [1, 2, 3, 4, 12, 13, 6, 10] ;
    Path = [1, 5, 6, 10] ;
    false.

    [2] 19 ?- path_hp(1,10,Path,2,HPout). 
    false.

    [2] 20 ?- path_hp(1,10,Path,3,HPout).
    Path = [1, 2, 12, 13, 6, 10] ;
    Path = [1, 2, 3, 7, 13, 6, 10] ;
    false.

    [2] 21 ?- path_hp(1,10,Path,5,HPout).
    Path = [1, 2, 12, 13, 6, 10] ;
    Path = [1, 2, 3, 7, 13, 6, 10] ;
    Path = [1, 2, 3, 7, 8, 4, 12, 13, 6|...] ;
    Path = [1, 2, 3, 4, 12, 13, 6, 10] ;
    Path = [1, 5, 6, 10] ;
    false.

    [2] 22 ?- path_hp(1,10,Path,4,HPout).
    Path = [1, 2, 12, 13, 6, 10] ;
    Path = [1, 2, 3, 7, 13, 6, 10] ;
    Path = [1, 2, 3, 7, 8, 4, 12, 13, 6|...] ;
    false.

I played around with both programs and test world, trying different values for the health, adding different branches, loops, barriers and teleports, to verify that the problem works as intended.