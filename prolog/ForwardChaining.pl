% Knowledge base example
:- dynamic(ancestor/2).
parent(john, mary).
parent(mary, susan).
parent(susan, tom).

% Forward chaining: derive all ancestor facts
forward_chain :-
    retractall(ancestor(_, _)), % Clear previous ancestor facts
    findall(_, assert_ancestor, _),
    format("Derived ancestor facts:~n", []),
    print_ancestors.

% Rule to assert ancestor facts using forward chaining
assert_ancestor :-
    (   parent(X, Y),
        \+ ancestor(X, Y)
    ->  assertz(ancestor(X, Y)),
        fail
    ;   true
    ),
    (   parent(X, Z),
        ancestor(Z, Y),
        \+ ancestor(X, Y)
    ->  assertz(ancestor(X, Y)),
        fail
    ;   true
    ).

% Print all ancestor facts
print_ancestors :-
    forall(ancestor(X, Y), format("ancestor(~w, ~w).~n", [X, Y])).

% Main function to demonstrate forward chaining
main :-
    format("Forward Chaining Demo~n", []),
    forward_chain.

% To run: ?- main.
