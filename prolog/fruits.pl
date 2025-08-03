% --- Facts: fruit(Name, Color) ---

fruit(apple, red).
fruit(banana, yellow).
fruit(grape, purple).
fruit(orange, orange).
fruit(watermelon, green).
fruit(blueberry, blue).
fruit(guava, green).
fruit(mango, yellow).

% --- Query to trigger backtracking and get all fruits of a particular color ---

% get_fruit_by_color(Color)
get_fruit_by_color(Color) :-
    fruit(Fruit, Color),
    format('~w is ~w in color.~n', [Fruit, Color]),
    fail.

% add a dummy success clause to prevent failure at end
get_fruit_by_color(_).

% --- Main function ---
main :-
    % Example: print all green fruits
    get_fruit_by_color(green),
    halt.
