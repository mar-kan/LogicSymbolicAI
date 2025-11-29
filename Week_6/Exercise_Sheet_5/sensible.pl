sensible(Word) :-
    atom_chars(Word, List),
    sensible_list(List).

sensible_list([]).
sensible_list(List) :-
    valid_syllable(List, Rest),
    sensible_list(Rest).

valid_syllable([C1,V,C2|T], T) :-
    consonant(C1),
    vowel(V),
    consonant(C2).
valid_syllable([C,V|T], T) :-
    consonant(C),
    vowel(V).
valid_syllable([V,C|T], T) :-
    vowel(V),
    consonant(C).

consonant(Letter) :-
    \+ vowel(Letter).

vowel(a). 
vowel(e). 
vowel(i). 
vowel(o). 
vowel(u).