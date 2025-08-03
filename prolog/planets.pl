% --- Facts ---

% planet(Name, DistanceFromSun_MillionKm, Diameter_Km, MoonsCount, Type)
planet(mercury, 58, 4879, 0, terrestrial).
planet(venus, 108, 12104, 0, terrestrial).
planet(earth, 150, 12742, 1, terrestrial).
planet(mars, 228, 6779, 2, terrestrial).
planet(jupiter, 778, 139820, 79, gas_giant).
planet(saturn, 1429, 116460, 83, gas_giant).
planet(uranus, 2871, 50724, 27, ice_giant).
planet(neptune, 4495, 49244, 14, ice_giant).

% --- Rules ---

% is_inner_planet(Name)
is_inner_planet(Name) :-
    planet(Name, Distance, _, _, _),
    Distance < 300.

% has_moons(Name)
has_moons(Name) :-
    planet(Name, _, _, Moons, _),
    Moons > 0.

% planet_type(Name, Type)
planet_type(Name, Type) :-
    planet(Name, _, _, _, Type).

% largest_planet(Name)
largest_planet(Name) :-
    planet(Name, _, Diameter, _, _),
    \+ (planet(_, _, D, _, _), D > Diameter).

% farthest_planet(Name)
farthest_planet(Name) :-
    planet(Name, Distance, _, _, _),
    \+ (planet(_, D, _, _, _), D > Distance).
