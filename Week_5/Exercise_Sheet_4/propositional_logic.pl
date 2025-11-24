t_value(Assignment, P, V) :-
    member(P-V, Assignment).

% Negation
t_value(Assignment, neg(F), t) :-
    t_value(Assignment, F, f).
t_value(Assignment, neg(F), f) :-
    t_value(Assignment, F, t).

% Conjunction
t_value(Assignment, and(F1, F2), t) :-
    t_value(Assignment, F1, t),
    t_value(Assignment, F2, t).

t_value(Assignment, and(F1, _), f) :-
    \+ t_value(Assignment, F1, t).
t_value(Assignment, and(_, F2), f) :-
    \+ t_value(Assignment, F2, t).

% Disjunction
t_value(Assignment, or(F1, F2), t) :-
    (t_value(Assignment, F1, t);
     t_value(Assignment, F2, t)).
t_value(Assignment, or(F1, F2), f) :-
    t_value(Assignment, F1, f),
    t_value(Assignment, F2, f).

% Implication
t_value(Assignment, implies(F1, F2), t) :-
    (t_value(Assignment, F1, f);
     t_value(Assignment, F2, t)).
t_value(Assignment, implies(F1, F2), f) :-
    t_value(Assignment, F1, t),
    t_value(Assignment, F2, f).

% Equivalence
t_value(Assignment, equiv(F1, F2), t) :-
    t_value(Assignment, F1, t) is t_value(Assignment, F2, t).
t_value(Assignment, equiv(F1, F2), f) :-
    \+ t_value(Assignment, F1, t) is t_value(Assignment, F2, t).


% Evaluate p AND q when p is true and q is false
% ?- t_value([p-t, q-f], and(p, q), V).
% V = f.

% Evaluate p -> q when p is true and q is true
% ?- t_value([p-t, q-t], implies(p, q), V).
% V = t.

% Evaluate a more complex formula
% ?- t_value([p-t, q-f, r-t], implies(and(p, q), or(p, r)), V).
% V = t.

% Find assignment that makes a formula true
% ?- t_value([p-Vp, q-Vq], and(p, q), t).
% Vp = Vq, Vq = t.


% tried negation on conjunction and equivalence
% For negation, disjunction and implication could not think something besides reversing some t/f and adding negation
