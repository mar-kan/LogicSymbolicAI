:- discontiguous father/2.
:- discontiguous mother/2.

parent(Pa,Ch) :-
    father(Pa,Ch).
parent(Pa,Ch) :-
    mother(Pa,Ch).

grandparent(Gp,Gc) :-
    parent(Gp,Pa),
    parent(Pa,Gc).

ancestor(Anc,Des) :-
    parent(Anc,Des).
ancestor(Anc,Des) :-
    parent(Anc,Ch),
    ancestor(Ch,Des).

% 2.1
greatgrandfather(GGp, Child) :-
    father(GGp, Gp),
    grandparent(Gp, Child).

% 2.2
greatgrandparent(Ggp, Child) :-
    parent(Ggp, Gp),
    grandparent(Gp, Child).

distant_ancestor(DistAnc, Des) :-
    greatgrandparent(DistAnc, Des).
distant_ancestor(DistAnc, Des) :-
    parent(DistAnc, Anc),
    distant_ancestor(Anc, Des).

% using negation
distant_ancestor_neg(DistAnc, Des) :-
    \+ parent(DistAnc, Des),
    \+ grandparent(DistAnc, Des),
    ancestor(DistAnc, Des).

% 2.3
known_ancestry(Des) :-
    greatgrandparent(_, Des),
    mother(_, Des),
    father(_, Des).

% 2.4 
male_name(Name) :-
    first_name(Man, Name),
    father(Man, _),!.

female_name(Name) :-
    first_name(Woman, Name),
    mother(Woman, _),!.

father(person1, person2).
mother(person3, person4).
father(person2, person4).
father(person5, person6).
mother(person4, person6).
father(person7, person1).

father(person8, person12).
mother(person10, person12).
father(person8, person13).
mother(person10, person13).
father(person8, person14).
mother(person10, person14).

father(person9, person15).
mother(person11, person15).
father(person9, person16).
mother(person11, person16).
father(person9, person17).
mother(person11, person17).

father(person1, person18).
mother(person4, person18).
father(person1, person19).
mother(person4, person19).

first_name(person1, august).
first_name(person2, ben).
first_name(person3, dorothee).
first_name(person4, clara).
first_name(person5, daniel).
first_name(person6, emily).
first_name(person7, gregor).
first_name(person8, august).
first_name(person9, august).
first_name(person10, dorothee).
first_name(person11, dorothee).
first_name(person12, lena).
first_name(person13, paul).
first_name(person14, tom).
first_name(person15, nina).
first_name(person16, max).
first_name(person17, leo).
first_name(person18, julia).
first_name(person19, elias).

second_name(person1, arnolds).
second_name(person2, arnolds).
second_name(person3, blum).
second_name(person4, arnolds).
second_name(person5, schmidt).
second_name(person6, schmidt).
second_name(person7, arnolds).
second_name(person8, meier).
second_name(person9, hoffmann).
second_name(person10, krueger).
second_name(person11, vogt).
second_name(person12, meier).
second_name(person13, meier).
second_name(person14, meier).
second_name(person15, hoffmann).
second_name(person16, hoffmann).
second_name(person17, hoffmann).
second_name(person18, arnolds).
second_name(person19, arnolds).
