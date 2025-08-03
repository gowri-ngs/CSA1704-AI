% --- Facts ---

% bird(Name)
bird(sparrow).
bird(penguin).
bird(eagle).
bird(ostrich).
bird(pigeon).
bird(parrot).
bird(kiwi).

% cannot_fly(Name)
cannot_fly(penguin).
cannot_fly(ostrich).
cannot_fly(kiwi).

% can_fly(Name)
can_fly(Bird) :-
    bird(Bird),
    \+ cannot_fly(Bird).

% --- Query Examples ---

% To check if a bird can fly:
% ?- can_fly(sparrow).       % true
% ?- can_fly(penguin).       % false

% To print if a bird can fly or not
can_bird_fly(Bird) :-
    can_fly(Bird),
    format('~w can fly.~n', [Bird]).

can_bird_fly(Bird) :-
    cannot_fly(Bird),
    format('~w cannot fly.~n', [Bird]).
