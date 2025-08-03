% --- Facts ---

% parent(Parent, Child)
parent(john, mary).
parent(john, mike).
parent(susan, mary).
parent(susan, mike).
parent(mary, alice).
parent(mary, bob).
parent(david, alice).
parent(david, bob).
parent(mike, tom).
parent(linda, tom).

% male(Name)
male(john).
male(mike).
male(david).
male(bob).
male(tom).

% female(Name)
female(susan).
female(mary).
female(alice).
female(linda).

% --- Rules ---

% father(Father, Child)
father(F, C) :-
    parent(F, C),
    male(F).

% mother(Mother, Child)
mother(M, C) :-
    parent(M, C),
    female(M).

% sibling(Person1, Person2)
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% grandfather(Grandfather, Grandchild)
grandfather(GF, GC) :-
    parent(GF, P),
    parent(P, GC),
    male(GF).

% grandmother(Grandmother, Grandchild)
grandmother(GM, GC) :-
    parent(GM, P),
    parent(P, GC),
    female(GM).

% uncle(Uncle, Person)
uncle(U, X) :-
    parent(P, X),
    sibling(P, U),
    male(U).

% aunt(Aunt, Person)
aunt(A, X) :-
    parent(P, X),
    sibling(P, A),
    female(A).

% cousin(Cousin1, Cousin2)
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2).

% --- Main ---
main :-
    write('Father of alice:'), nl, 
    (father(F1, alice), write(F1), nl, fail ; true),
    write('Mother of tom:'), nl, 
    (mother(M1, tom), write(M1), nl, fail ; true),
    write('Siblings of bob:'), nl, 
    (sibling(bob, S1), write(S1), nl, fail ; true),
    write('Grandfathers of tom:'), nl, 
    (grandfather(GF1, tom), write(GF1), nl, fail ; true),
    write('Aunts of alice:'), nl, 
    (aunt(A1, alice), write(A1), nl, fail ; true),
    write('Cousins of tom:'), nl, 
    (cousin(tom, C1), write(C1), nl, fail ; true),
    halt.
