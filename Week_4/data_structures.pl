programming_course(course(
    lecturer(anna, abel),
    course(ai001),
    daytime(monday, 14, 16),
    room(101)
)).

weekday(course(_,_,daytime(Day,_,_),_),Day).

list([]).
list([_|B]) :- list(B).

nat(z).
nat(s(N)) :- nat(N).

myplus(z, Y, Y) :-
    nat(Y).
myplus(X,z,X) :-
    nat(X).
myplus(s(X), s(Y), s(s(Z))) :-
    myplus(X,Y,Z).

mymember(X,[X|_]).
mymember(X,[_|T]) :- mymember(X,T).