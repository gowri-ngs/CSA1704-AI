% --- Best First Search in Prolog ---

% Define edges: edge(Node, Neighbor, Cost)
edge(a, b, 1).
edge(a, c, 3).
edge(b, d, 1).
edge(b, e, 5).
edge(c, f, 4).
edge(d, g, 2).
edge(e, g, 1).
edge(f, g, 7).

% Heuristic values: h(Node, HeuristicValue)
h(a, 7).
h(b, 6).
h(c, 5).
h(d, 4).
h(e, 3).
h(f, 6).
h(g, 0).

% Best First Search main predicate
best_first(Start, Goal, Path) :-
    bfs([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

% BFS implementation
bfs([[Goal|Rest] | _], Goal, [Goal|Rest]).
bfs([Path | Paths], Goal, Result) :-
    extend(Path, NewPaths),
    append(Paths, NewPaths, AllPaths),
    sort_paths(AllPaths, Sorted),
    bfs(Sorted, Goal, Result).

% Extend a path by one step
extend([Node | Rest], NewPaths) :-
    findall([Next, Node | Rest],
            (edge(Node, Next, _), \+ member(Next, [Node | Rest])),
            NewPaths).

% Sort paths based on heuristic of head node
sort_paths(Paths, Sorted) :-
    add_heuristics(Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

% Add heuristic values to paths as pairs
add_heuristics([], []).
add_heuristics([Path|Rest], [H-Path|PairsRest]) :-
    path_heuristic(Path, H),
    add_heuristics(Rest, PairsRest).

% Heuristic value of a path = h(head node)
path_heuristic([Node | _], H) :-
    h(Node, H).

% Main predicate to run the search and print the result, then halt
main :-
    Start = a,
    Goal = g,
    (   best_first(Start, Goal, Path)
    ->  format('Best path from ~w to ~w: ~w~n', [Start, Goal, Path])
    ;   format('No path found from ~w to ~w.~n', [Start, Goal])
    ),
    halt.
