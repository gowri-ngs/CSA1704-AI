def is_valid(state, node, color, adj):
    return all(state.get(nei) != color for nei in adj[node])

def backtrack(state, nodes, colors, adj):
    if len(state) == len(nodes): return state
    node = next(n for n in nodes if n not in state)
    for color in colors:
        if is_valid(state, node, color, adj):
            state[node] = color
            result = backtrack(state, nodes, colors, adj)
            if result: return result
            del state[node]
    return None

# Example usage:
nodes = ['WA', 'NT', 'SA', 'Q', 'NSW', 'V', 'T']
colors = ['Red', 'Green', 'Blue']
adj = {
    'WA': ['NT', 'SA'],
    'NT': ['WA', 'SA', 'Q'],
    'SA': ['WA', 'NT', 'Q', 'NSW', 'V'],
    'Q': ['NT', 'SA', 'NSW'],
    'NSW': ['SA', 'Q', 'V'],
    'V': ['SA', 'NSW'],
    'T': []
}

solution = backtrack({}, nodes, colors, adj)
print(solution)
