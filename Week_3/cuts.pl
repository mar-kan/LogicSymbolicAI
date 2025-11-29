%continental_city(goerlitz).
continental_city(leipzig).
continental_city(potsdam).
continental_city(berlin).
continental_city(paris).
continental_city(marseille).

%lies_in(goerlitz,poland).
%lies_in(goerlitz,germany).
lies_in(blackpool,uk).
lies_in(london,uk).
lies_in(leipzig,germany).
lies_in(potsdam,germany).
lies_in(berlin,germany).
lies_in(paris,france).
lies_in(marseille,france).

continental(Country) :-
    continental_city(City),
    lies_in(City,Country).
continental(poland).