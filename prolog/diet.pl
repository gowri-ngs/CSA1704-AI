% --- Facts ---

% disease(Name)
disease(diabetes).
disease(hypertension).
disease(obesity).
disease(anemia).
disease(gastritis).

% diet(Disease, RecommendedFoodList)
diet(diabetes, [whole_grains, vegetables, lean_protein, low_glycemic_fruits]).
diet(hypertension, [low_sodium_foods, leafy_greens, berries, oats]).
diet(obesity, [high_fiber_foods, lean_protein, fruits, vegetables]).
diet(anemia, [iron_rich_foods, leafy_vegetables, meat, beans]).
diet(gastritis, [non_spicy_foods, bananas, oatmeal, boiled_vegetables]).

% avoid(Disease, FoodsToAvoid)
avoid(diabetes, [sugar, white_bread, soda]).
avoid(hypertension, [salt, canned_foods, pickles]).
avoid(obesity, [junk_food, sugary_drinks, fried_items]).
avoid(anemia, [tea, coffee, calcium_rich_foods_during_meals]).
avoid(gastritis, [spicy_food, alcohol, citrus_fruits]).

% --- Rules ---

% suggest_diet(Disease)
suggest_diet(Disease) :-
    disease(Disease),
    diet(Disease, Include),
    avoid(Disease, Avoid),
    format('For ~w:~n', [Disease]),
    format('  Include: ~w~n', [Include]),
    format('  Avoid: ~w~n', [Avoid]).

% --- Main ---

main :-
    suggest_diet(diabetes),
    nl,
    suggest_diet(hypertension),
    nl,
    suggest_diet(obesity),
    nl,
    suggest_diet(anemia),
    nl,
    suggest_diet(gastritis),
    halt.
