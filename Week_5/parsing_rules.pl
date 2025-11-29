:- op(900, xfx, <--).
:- dynamic determiner/2.
:- dynamic adjective/2.
:- dynamic noun/2.
:- dynamic auxiliary/2.
:- dynamic verb/2.
:- dynamic sentence/2.
:- dynamic nounphrase/2.
:- dynamic verbphrase/2.

%fact(the(0,1)).
%fact(slithy(1,2)).
%fact(toves(2,3)).
%fact(did(3,4)).
%fact(gimble(4,5)).

the(0,1).
slithy(1,2).
toves(2,3).
did(3,4).
gimble(4,5).

determiner(X,Y) <-- [the(X,Y)].
adjective(X,Y) <-- [slithy(X,Y)].
noun(X,Y) <-- [toves(X,Y)].
auxiliary(X,Y) <-- [did(X,Y)].
verb(X,Y) <-- [gimble(X,Y)].

sentence(X,Z) <-- [nounphrase(X,Y), verbphrase(Y,Z)].
nounphrase(W,Z)  <--
    [determiner(W,X), adjective(X,Y), noun(Y,Z)].
verbphrase(X,Z)  <-- [auxiliary(X,Y), verb(Y,Z)].