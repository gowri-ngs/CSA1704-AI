from itertools import permutations

def is_solvable(words, result):
    unique = set(''.join(words) + result)
    if len(unique) > 10:
        return False
    chars = list(unique)
    first = set(w[0] for w in words + [result])

    def to_number(s, mapping):
        return int(''.join(str(mapping[c]) for c in s))

    for perm in permutations(range(10), len(chars)):
        mapping = dict(zip(chars, perm))
        if any(mapping[c] == 0 for c in first):
            continue
        total = sum(to_number(w, mapping) for w in words)
        if total == to_number(result, mapping):
            print("Yes")
            print("Mapping:")
            for c in sorted(mapping):
                print(f"{c} = {mapping[c]}")
            print("\nWord values:")
            for w in words:
                print(f"{w} = {to_number(w, mapping)}")
            print(f"{result} = {to_number(result, mapping)}")
            return True
    print("No")
    return False

# Example
words = ["SIX", "SEVEN", "SEVEN"]
result = "TWENTY"

is_solvable(words, result)
