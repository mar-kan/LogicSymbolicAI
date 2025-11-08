term(p).
term(q).
term(r).
term(s).

formula(F) :- term(F).
formula(and(F1, F2)) :- formula(F1), formula(F2).
formula(or(F1, F2)) :- formula(F1), formula(F2).
formula(neg(F)) :- formula(F).
formula(implies(F1, F2)) :- formula(F1), formula(F2).

t_value(p, t).
t_value(q, f).
t_value(r, t).
t_value(s, f).

t_value(and(F1, F2), t) :- t_value(F1, t), t_value(F2, t).
t_value(and(F1, F2), f) :- t_value(F1, f).
t_value(and(F1, F2), f) :- t_value(F2, f).

t_value(or(F1, F2), t) :- t_value(F1, t).
t_value(or(F1, F2), t) :- t_value(F2, t).
t_value(or(F1, F2), f) :- t_value(F1, f), t_value(F2, f).

t_value(neg(F), t) :- t_value(F, f).
t_value(neg(F), f) :- t_value(F, t).

t_value(implies(F1, F2), f) :- t_value(F1, t), t_value(F2, f).
t_value(implies(F1, F2), t) :- t_value(F1, t), t_value(F2, t).
t_value(implies(F1, F2), t) :- t_value(F1, f), t_value(F2, f).
t_value(implies(F1, F2), t) :- t_value(F1, f), t_value(F2, t).
