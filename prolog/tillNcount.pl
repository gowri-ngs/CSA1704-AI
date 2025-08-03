% Main program for GNU Prolog (gprolog) on Fedora Kinoite

% Usage:
% 1. Save this file as sum_to_n.pl
% 2. Open a Fedora Kinoite terminal.
% 3. Run: gprolog --consult-file sum_to_n.pl --entry-goal main

main :-
    N = 5,  % You can change this number as needed
    sum_to_n(N, Sum),
    write('Sum from 1 to '), write(N), write(' is '), write(Sum), nl,
    halt.

% Base case
sum_to_n(0, 0).

% Recursive case
sum_to_n(N, Sum) :-
    N > 0,
    N1 is N - 1,
    sum_to_n(N1, TempSum),
    Sum is TempSum + N.