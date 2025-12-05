# Test log of worlds.pl

## 1. Test team predecate

### Test world:

    empty_space(1,2).
    monster(2,3,1).
    monster(3,4,2).
    monster(4,5,1).
    monster(5,6,3).
    monster(6,7,1).
    monster(7,8,8).
    empty_space(8,9).
    monster(9,10,10).
    monster(10,11,11).
    monster(11,12,1).
    monster(12,13,5).

#### Test queries:

    [4] 36 ?- team(1,13).
    false.

    [4] 37 ?- team(2,13).
    false.

    [4] 38 ?- team(1,8). 
    false.

    [4] 39 ?- team(2,8).
    true ;
    false.

    [4] 40 ?- team(2,9).
    false.

    [4] 41 ?- team(8,13).
    false.

    [4] 42 ?- team(9,13).
    true ;
    false.

    [4] 43 ?- team(2,4).
    false.

    [4] 44 ?- team(2,5).
    true ;
    false.

## 2. Test ordinary_level predecate

### Test world:

    empty_space(1,2).
    monster(2,3,1).
    empty_space(3,4).
    empty_space(4,5).
    puzzle(5,6,7).
    empty_space(6,7).
    empty_space(7,8).
    empty_space(8,9).
    empty_space(9,10).
    empty_space(10,11).
    empty_space(11,12).
    empty_space(12,13).
    empty_space(13,14).

##### Test queries:

    [4] 57 ?- ordinary_level(2,14).
    false.

    [4] 58 ?- ordinary_level(2,2). 
    false.

    [4] 59 ?- ordinary_level(2,3).
    true ;
    false.

    [4] 60 ?- ordinary_level(2,4).
    true ;
    false.

    [4] 61 ?- ordinary_level(2,5).
    true ;
    false.

    [4] 62 ?- ordinary_level(2,6).
    false.

    [4] 63 ?- ordinary_level(5,6).
    true ;
    false.

    [4] 64 ?- ordinary_level(5,14).
    true ;
    false.

## 3. Test ordinary_world predecate

### Test world:

    empty_space(1,2).
    monster(2,3,1).
    empty_space(3,4).
    empty_space(4,5).
    puzzle(5,6,7).
    empty_space(6,7).
    empty_space(7,8).
    empty_space(8,9).
    empty_space(9,10).
    empty_space(10,11).
    empty_space(11,12).
    empty_space(12,13).
    empty_space(13,14).
    puzzle(14,15,7).
    empty_space(15,16).
    empty_space(16,17).
    monster(17,18,1).
    monster(18,19,1).
    monster(19,20,1).
    puzzle(20,21,7).
    puzzle(21,22,7).

##### Test queries:

    [5] 87 ?- ordinary_world(14,20).
    true ;
    false.

    [5] 88 ?- ordinary_world(13,20).
    false.

    [5] 89 ?- ordinary_world(1,22). 
    false.

    [5] 90 ?- ordinary_world(2,22).
    false.

    [5] 91 ?- ordinary_world(2,20).
    true ;
    false.

## 4. Test bonus_level predecate

### Test world:

    empty_space(1,2).
    empty_space(2,3).
    empty_space(3,4).
    empty_space(4,5).
    empty_space(5,6).
    empty_space(6,7).
    empty_space(7,8).
    empty_space(8,9).
    empty_space(9,10).
    empty_space(10,11).
    empty_space(11,12).
    empty_space(12,13).
    empty_space(13,14).
    empty_space(14,15).
    empty_space(15,16).
    empty_space(16,17).
    empty_space(17,18).
    empty_space(18,19).
    empty_space(19,20).
    monster(20,21,1).
    chest(21).
    empty_space(21,22).
    empty_space(22,23).
    monster(23,24,2).
    chest(24).

##### Test queries:

    [5] 93 ?- bonus_level(1,21).
    true ;
    false.

    [5] 94 ?- bonus_level(21,21).
    false.

    [5] 95 ?- bonus_level(20,21).
    true ;
    false.

    [5] 96 ?- bonus_level(19,21).
    true ;
    false.

    [5] 97 ?- bonus_level(9,21). 
    true ;
    false.

    [5] 98 ?- bonus_level(23,24).
    false.

    [5] 99 ?- bonus_level(21,24).
    false.


## 5. Test bonus_world predecate

### Test world:

    puzzle(1,2,7).
    empty_space(2,3).
    empty_space(3,4).
    empty_space(4,5).

    empty_space(5,6).
    empty_space(6,7).
    empty_space(7,8).
    empty_space(8,9).
    monster(9,10,1).
    chest(10).

    puzzle(10,11,7).
    empty_space(11,12).
    empty_space(12,13).

    monster(13,14,2).
    chest(14).
    empty_space(14,15).

    puzzle(15,16,7).
    empty_space(16,17).
    empty_space(17,18).

    monster(18,19,3).
    monster(19,20,3).
    monster(20,21,3).
    monster(21,22,3).

##### Test queries:

    45 ?- bonus_world(1,22).
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    false.

    46 ?- bonus_world(2,22).
    true ;
    true ;
    false.

    47 ?- bonus_world(9,22).
    true ;
    true ;
    true ;
    true ;
    false.

    48 ?- bonus_world(11,22).
    false.

    49 ?- bonus_world(1,21). 
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    true ;
    false.

    50 ?- bonus_world(1,20).
    false.

## 6. Comparison of different parsings
## 6.1 Test world 1

Using the same test world as in the last test above

### Normal prolog execution

    4 ?- time(bonus_world(1,22)).
    % 2,363,978 inferences, 0.078 CPU in 0.083 seconds (94% CPU, 30258918 Lips)
    true ;
    % 601 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 2,206 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 2,200 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 2,194 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 2,188 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 2,182 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 2,176 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 2,753 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 600 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 2,206 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 2,200 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    ....

The normal execution is fast but does a lot of inferences, especially on the first parsing.

### Depth-first bottom up

    [1] 4 ?- time(df_backward(bonus_world(1,21))).
    % 13,301,214 inferences, 0.484 CPU in 0.489 seconds (99% CPU, 27460571 Lips)
    true ;
    % 3,340 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 12,427 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    true ;
    % 12,381 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    true ;
    % 12,337 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    true ;
    % 12,295 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    true ;
    % 12,255 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    true ;
    % 12,217 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    true ;
    % 15,461 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    true
    ....

Still fast but slower than the normal execution. It also does much more inferences.

### Breadth-first bottom up

Using the same test world, the query:

    bf_backward(bonus_world(1,21))

does not execute, it just freezes. So I imagine it makes even more inferences.

### Depth-first top down

    [3] 16 ?- time(df_enum(                                               
        [ puzzle(1,2,7),
            empty_space(2,3),
            empty_space(3,4),
            empty_space(4,5),
            empty_space(5,6),
            empty_space(6,7),
            empty_space(7,8),
            empty_space(8,9),
            monster(9,10,1),
            chest(10),
            puzzle(10,11,7),
            empty_space(11,12),
            empty_space(12,13),
            monster(13,14,2),
            chest(14),
            empty_space(14,15),
            puzzle(15,16,7),
            empty_space(16,17),
            empty_space(17,18),
            monster(18,19,3),
            monster(19,20,3),
            monster(20,21,3),
            monster(21,22,3)
        ],
        bonus_world(1,22)
    )).
    % 36,873 inferences, 0.000 CPU in 0.005 seconds (0% CPU, Infinite Lips)
    true ;
    % 20,607 inferences, 0.000 CPU in 0.006 seconds (0% CPU, Infinite Lips)
    false.

Much better than all previous experiments. Much less inferences and only two solutions.

### Breadth-first top down

2 ?- time(bf_enum(
       [ puzzle(1,2,7),
         empty_space(2,3),
         empty_space(3,4),
         empty_space(4,5),
         empty_space(5,6),
         empty_space(6,7),
         empty_space(7,8),
         empty_space(8,9),
         monster(9,10,1),
         chest(10),
         puzzle(10,11,7),
         empty_space(11,12),
         empty_space(12,13),
         monster(13,14,2),
         chest(14),
         empty_space(14,15),
         puzzle(15,16,7),
         empty_space(16,17),
         empty_space(17,18),
         monster(18,19,3),
         monster(19,20,3),
         monster(20,21,3),
         monster(21,22,3)
       ],
       bonus_world(1,22)
   )).
% 37,316 inferences, 0.016 CPU in 0.004 seconds (437% CPU, 2388224 Lips)
true ;
% 16,863 inferences, 0.000 CPU in 0.004 seconds (0% CPU, Infinite Lips)
false.

More or less the same as the DFS top-down.

## 6.2 Test world 2

Using a smaller world to be able to execute depth-first as well

    monster(1,2,1).
    chest(2).

    puzzle(2,3,7).
    empty_space(3,4).
    empty_space(4,5).

    puzzle(5,6,7).
    empty_space(6,7).

    monster(7,8,3).
    monster(8,9,3).
    monster(9,10,3).

### Normal prolog execution

2 ?- time(bonus_world(1,10)).
% 10,686 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
true ;
% 734 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
true ;
% 7,089 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
true ;
% 733 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
true ;
% 5,389 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
false.

The normal execution is very fast and has a moderate amount of inferences.

### Depth-first bottom up

    [3] 7 ?- time(df_backward(bonus_world(1,10))).
    % 59,206 inferences, 0.000 CPU in 0.003 seconds (0% CPU, Infinite Lips)
    true ;
    % 4,054 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    true ;
    % 39,296 inferences, 0.016 CPU in 0.017 seconds (94% CPU, 2514944 Lips)
    true ;
    % 4,054 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 29,858 inferences, 0.000 CPU in 0.002 seconds (0% CPU, Infinite Lips)
    false.

Still very fast, inferences rise compared to the normal execution.

### Breadth-first bottom up

    [3] 6 ?- time(bf_backward(bonus_world(1,10))).
    % 6,747,104 inferences, 0.203 CPU in 0.255 seconds (80% CPU, 33216512 Lips)
    true ;
    % 3,305 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 34,929 inferences, 0.016 CPU in 0.016 seconds (99% CPU, 2235456 Lips)
    true ;
    % 3,151 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    true ;
    % 959,739 inferences, 0.031 CPU in 0.034 seconds (93% CPU, 30711648 Lips)
    false.

As expected from the problems above, it does much more inferences than the other methods and is quite inefficient in this case.

### Depth-first top down

    [3] 12 ?- time(df_enum([monster(1,2,1), chest(2),   
                puzzle(2,3,7), empty_space(3,4), empty_space(4,5),
                puzzle(5,6,7), empty_space(6,7),
                monster(7,8,3), monster(8,9,3), monster(9,10,3)],
            bonus_world(1,10))).
    % 720 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    false.

### Breadth-first top down

    [3] 13 ?- time(bf_enum([monster(1,2,1), chest(2),   
                puzzle(2,3,7), empty_space(3,4), empty_space(4,5),
                puzzle(5,6,7), empty_space(6,7),
                monster(7,8,3), monster(8,9,3), monster(9,10,3)],
            bonus_world(1,10))).
    % 691 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    false.

The top down searches seem to be the best solutions, doing the minimum number of inferences, being the fastest and also returning very few solutions.

## 6.3 Test world 3: Using free query valid_world(S,E).
Using the smaller world but with bonus level between levels:

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

### Normal prolog execution

    [2] 10 ?- time(bonus_world(S,E)).    
    % 27,991 inferences, 0.000 CPU in 0.002 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 630 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 3,199 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 630 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 1,787 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 2,
    E = 10 ;
    % 1,360 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 3,
    E = 10 ;
    % 7,180 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 294 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 564 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    ...

### Depth-first bottom up

    2 ?- time(df_backward(bonus_world(S,E))).
    % 154,289 inferences, 0.000 CPU in 0.006 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 3,473 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 17,569 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 3,472 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 9,833 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    S = 2,
    E = 10 ;
    % 7,491 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    S = 3,
    E = 10 ;
    % 39,594 inferences, 0.000 CPU in 0.003 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 1,617 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 3,113 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 4,428 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 1,617 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 3,113 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 4,378 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 1,617 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 3,113 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10
    ...

### Breadth-first bottom up

    [1] 3 ?- time(bf_backward(bonus_world(S,E))).
    % 12,305,731 inferences, 0.469 CPU in 0.479 seconds (98% CPU, 26252226 Lips)
    S = 4,
    E = 10 ;
    % 29,178 inferences, 0.000 CPU in 0.006 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 129,887 inferences, 0.000 CPU in 0.009 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 27,936 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 17,990,936 inferences, 0.609 CPU in 0.630 seconds (97% CPU, 29523587 Lips)
    S = 3,
    E = 10 ;
    % 18,898,977 inferences, 0.625 CPU in 0.636 seconds (98% CPU, 30238363 Lips)
    S = 2,
    E = 10 ;
    % 116,864,644 inferences, 3.844 CPU in 3.868 seconds (99% CPU, 30403810 Lips)
    S = 1,
    E = 10 ;
    % 55,151 inferences, 0.016 CPU in 0.015 seconds (105% CPU, 3529664 Lips)
    S = 1,
    E = 10 ;
    % 91,775 inferences, 0.000 CPU in 0.004 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 77,003 inferences, 0.000 CPU in 0.005 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 55,001 inferences, 0.000 CPU in 0.002 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 91,525 inferences, 0.000 CPU in 0.007 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10
    ...

### Depth-first top down

    2 ?- time(
        df_enum(
            [ puzzle(1,2,7),
            empty_space(2,3),
            empty_space(3,4),
            monster(4,5,1),
            chest(5),
            puzzle(5,6,7),
            empty_space(6,7),
            monster(7,8,3),
            monster(8,9,3),
            monster(9,10,3)
            ],
            bonus_world(S,E)
        )
    ).
    % 5,497 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    S = 2,
    E = 10 ;
    % 64 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 3,
    E = 10 ;
    % 63 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 63 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 5,702 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    false.

### Breadth-first top down

    3 ?- time(
            bf_enum(
                [ puzzle(1,2,7),
                empty_space(2,3),
                empty_space(3,4),
                monster(4,5,1),
                chest(5),
                puzzle(5,6,7),
                empty_space(6,7),
                monster(7,8,3),
                monster(8,9,3),
                monster(9,10,3)
                ],
                bonus_world(S,E)
            )
        ).
    % 6,934 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    S = 3,
    E = 10 ;
    % 503 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 4,
    E = 10 ;
    % 1,127 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 1,
    E = 10 ;
    % 126 inferences, 0.000 CPU in 0.000 seconds (0% CPU, Infinite Lips)
    S = 2,
    E = 10 ;
    % 3,875 inferences, 0.000 CPU in 0.001 seconds (0% CPU, Infinite Lips)
    false.

## Conclusion

For this particular program, the bottom up parsings are not efficient and are performing much worse. The top down parsings are the most efficient, showing more or less the same results. The normal prolog execution is neither very efficient not inefficient.