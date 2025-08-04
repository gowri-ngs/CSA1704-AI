% medicalDiagnosis.pl

% Knowledge base: symptoms for diseases
symptom(fever, flu).
symptom(cough, flu).
symptom(headache, flu).
symptom(rash, measles).
symptom(fever, measles).
symptom(sore_throat, cold).
symptom(runny_nose, cold).
symptom(cough, cold).

% Facts: person has symptoms
has_symptom(john, fever).
has_symptom(john, cough).
has_symptom(john, headache).
has_symptom(mary, rash).
has_symptom(mary, fever).
has_symptom(alex, sore_throat).
has_symptom(alex, runny_nose).
has_symptom(alex, cough).

% Rule: diagnose a person with a disease if they have all symptoms of that disease
diagnose(Person, Disease) :-
    setof(S, symptom(S, Disease), Symptoms),
    has_all_symptoms(Person, Symptoms).

has_all_symptoms(_, []).
has_all_symptoms(Person, [S|Rest]) :-
    has_symptom(Person, S),
    has_all_symptoms(Person, Rest).

% Main function: diagnose all persons
main :-
    setof(Person, S^has_symptom(Person, S), Persons),
    forall(member(P, Persons),
        (   (diagnose(P, D) ->
                format('~w is diagnosed with ~w.~n', [P, D])
            ;   format('No diagnosis for ~w.~n', [P])
            )
        )
    ).

% To run: ?- main.