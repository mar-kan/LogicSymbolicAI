country(denmark).
country(uk).
country(france).
country(germany).

capital(copenhagen, denmark).
capital(london, uk).
capital(paris,france).
capital(berlin, germany).

continental(germany).
continental(france).
continental(denmark).

non_continental(uk).
continental_capital(london).

continental_capital(City) :-
    capital(City,Country),
    continental(Country).

capital(X) :-
    capital(X,_).