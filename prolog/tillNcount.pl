% Entry point
:- initialization(main).

% Main program with predefined input
main :-
    N = 5,  % You can change this number as needed
    sum_to_n(N, Sum),
    format('Sum from 1 to ~w is ~w~n', [N, Sum]),
    halt.

% Base case
sum_to_n(0, 0).

% Recursive case
sum_to_n(N, Sum) :-
    N > 0,
    N1 is N - 1,
    sum_to_n(N1, TempSum),
    Sum is TempSum + N.