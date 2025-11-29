:- op(900, xfx, <--).
:- dynamic(parent/2).
:- dynamic(ancestor/2).
:- dynamic(descendant/2).
:- dynamic(grandparent/2).
:- dynamic(sibling/2).
:- dynamic(grandmother/2).
:- dynamic(grandfather/2).
:- dynamic(aunt_or_uncle/2).
:- dynamic(cousin/2).
:- dynamic(grandchild/2).
:- dynamic(niece_or_nephew/2).

grandmother(X,Y) <--
    [mother(X,Z),
    parent(Z,Y)].

grandfather(X,Y) <--
    [father(X,Z),
    parent(Z,Y)].

grandparent(X,Y) <--
    [parent(X,Z),
    parent(Z,Y)].

parent(X,Y) <--
    [father(X,Y)].
parent(X,Y) <--
    [mother(X,Y)].

ancestor(X,Y) <--
    [parent(X,Y)].

ancestor(X,Y) <--
    [parent(X,Z),
    ancestor(Z,Y)].

sibling(X,Y) <--
    [father(X,Father),
    father(Y,Father),
    mother(X,Mother),
    mother(Y,Mother)].

aunt_or_uncle(X,Y) <--
    [sibling(X,Z),
     parent(Z,Y)].

cousin(X,Y) <--
    [parent(X,Z),
    aunt_or_uncle(Z,Y)].

grandchild(Y,X) <--
    [parent(Z,Y),
    parent(X,Z)].

descendant(Y,X) <--
    [parent(X,Y)].

descendant(Y,X) <--
    [parent(Z,Y),
    descendant(Z,X)].

niece_or_nephew(Y,X) <--
    [parent(Z,Y),
    sibling(Z,X)].
