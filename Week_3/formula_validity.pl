term(p).
term(q).
term(r).
term(s).

% exercise 3
formula(Formula) :- term(Formula).
formula(neg(Formula)) :- formula(Formula).

formula(and(Formula1, Formula2)) :- 
    formula(Formula1), 
    formula(Formula2).

formula(or(Formula1, Formula2)) :- 
    formula(Formula1), 
    formula(Formula2).

formula(implies(Formula1, Formula2)) :- 
    formula(Formula1), 
    formula(Formula2).

% listing propositional formulas
formula(Formula, 0) :- term(Formula).

formula(Formula, Depth) :- 
    Depth > 0,
    formula(Formula, 0).

formula(neg(Formula), Depth) :- 
    Depth > 0,
    Depth_1 is Depth-1,    
    formula(Formula, Depth_1).

formula(and(Formula1, Formula2), Depth) :- 
    Depth > 0,
    Depth_1 is Depth-1,
    formula(Formula1, Depth_1), 
    formula(Formula2, Depth_1).

formula(or(Formula1, Formula2), Depth) :- 
    Depth > 0,
    Depth_1 is Depth-1,
    formula(Formula1, Depth_1), 
    formula(Formula2, Depth_1).

formula(implies(Formula1, Formula2), Depth) :- 
    Depth > 0,
    Depth_1 is Depth-1,
    formula(Formula1, Depth_1), 
    formula(Formula2, Depth_1).

% exercise 4

t_value(p, t).
t_value(q, f).
t_value(r, t).
t_value(s, f).

t_value(and(Formula1, Formula2), t) :- t_value(Formula1, t), t_value(Formula2, t).
t_value(and(Formula1, _), f) :- t_value(Formula1, f).
t_value(and(_, Formula2), f) :- t_value(Formula2, f).

t_value(or(Formula1, _), t) :- t_value(Formula1, t).
t_value(or(_, Formula2), t) :- t_value(Formula2, t).
t_value(or(Formula1, Formula2), f) :- t_value(Formula1, f), t_value(Formula2, f).

t_value(neg(Formula), t) :- t_value(Formula, f).
t_value(neg(Formula), f) :- t_value(Formula, t).

t_value(implies(Formula1, Formula2), f) :- t_value(Formula1, t), t_value(Formula2, f).
t_value(implies(Formula1, Formula2), t) :- t_value(Formula1, t), t_value(Formula2, t).
t_value(implies(Formula1, Formula2), t) :- t_value(Formula1, f), t_value(Formula2, f).
t_value(implies(Formula1, Formula2), t) :- t_value(Formula1, f), t_value(Formula2, t).
