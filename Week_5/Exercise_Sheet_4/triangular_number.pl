triangular_number(0,0).
triangular_number(1,1).

triangular_number(N,T) :-
    triangular_number(N, 0, T).

triangular_number(0, Sum, Sum).

triangular_number(N, Sum, T) :-
    N > 0,
    NewSum is Sum + N,
    N1 is N-1,
    triangular_number(N1, NewSum, T).