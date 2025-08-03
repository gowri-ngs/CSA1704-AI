% --- Initial State ---
% state(MonkeyPosition, MonkeyHasBanana, BoxPosition)

% Initial state: monkey is at door, doesn't have banana, box is at window
initial_state(state(door, no, window)).

% Final state: monkey has banana
final_state(state(_, yes, _)).

% --- Actions ---

% monkey can walk from one place to another
move(state(P1, no, B), walk(P1, P2), state(P2, no, B)) :-
    P1 \= P2.

% monkey can push the box from one place to another if both are at the same place
move(state(P, no, P), push(P, P2), state(P2, no, P2)) :-
    P \= P2.

% monkey can climb the box if both are at the same place
move(state(P, no, P), climb, state(on_box, no, P)).

% monkey can grasp banana only if on top of box and under banana (assume banana is at middle)
move(state(on_box, no, middle), grasp, state(on_box, yes, middle)).

% --- Path Finding ---

% path(InitialState, GoalState, Visited, Moves)
path(State, State, _, []).

path(State, Goal, Visited, [Move | Moves]) :-
    move(State, Move, NewState),
    \+ member(NewState, Visited),
    path(NewState, Goal, [NewState | Visited], Moves).

% --- Solve Problem ---

solve :-
    initial_state(Initial),
    final_state(Final),
    (   path(Initial, Final, [Initial], Moves)
    ->  write('Sequence of moves: '), nl,
        print_moves(Moves)
    ;   write('No solution found.'), nl
    ).

% --- Print Moves ---
print_moves([]).
print_moves([H | T]) :-
    write(H), nl,
    print_moves(T).

% --- Sample Runs ---
sample :-
    write('Sample: Monkey and box both at middle (solvable)'), nl,
    (   path(state(middle, no, middle), state(_, yes, _), [state(middle, no, middle)], Moves)
    ->  write('Sequence of moves: '), nl,
        print_moves(Moves), nl
    ;   write('No solution found.'), nl
    ).

% --- Main ---

main :-
    sample,
    halt.
