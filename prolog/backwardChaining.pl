% Knowledge base example
parent(john, mary).
parent(mary, susan).
parent(susan, tom).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Backward chaining query predicate
backward_chain(Query) :-
    (   call(Query)
    ->  format("~w is true.~n", [Query])
    ;   format("~w is false.~n", [Query])
    ).

% Main function to demonstrate backward chaining
main :-
    format("Backward Chaining Demo~n", []),
    backward_chain(ancestor(john, tom)),
    backward_chain(ancestor(mary, john)),
    backward_chain(ancestor(mary, susan)).

% To run: ?- main.
