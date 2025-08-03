% Define database of people: person(Name, DOB).
person('Alice', date(1990, 5, 21)).
person('Bob', date(1985, 12, 3)).
person('Charlie', date(2000, 7, 15)).
person('Diana', date(1997, 1, 9)).

main :-
    write('--- People Database ---'), nl,
    list_people,
    halt.

% Predicate to list all people
list_people :-
    person(Name, date(Y, M, D)),
    format('Name: ~w, DOB: ~w-~w-~w~n', [Name, Y, M, D]),
    fail.

% stop backtracking
list_people.