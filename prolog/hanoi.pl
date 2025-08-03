% --- Towers of Hanoi in Prolog ---

% hanoi(N, Source, Target, Auxiliary)
% Moves N disks from Source to Target using Auxiliary

hanoi(1, Source, Target, _) :-
    format('Move disk from ~w to ~w~n', [Source, Target]).

hanoi(N, Source, Target, Auxiliary) :-
    N > 1,
    M is N - 1,
    hanoi(M, Source, Auxiliary, Target),
    hanoi(1, Source, Target, _),
    hanoi(M, Auxiliary, Target, Source).

main :-
    % Example: solve Towers of Hanoi with 3 disks
    hanoi(3, left, right, center).
    halt.
