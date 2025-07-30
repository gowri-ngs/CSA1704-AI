def alpha_beta(node, depth, alpha, beta, maximizingPlayer, evaluate, children_fn):
    if depth == 0 or not children_fn(node):
        return evaluate(node)

    if maximizingPlayer:
        maxEval = float('-inf')
        for child in children_fn(node):
            eval = alpha_beta(child, depth - 1, alpha, beta, False, evaluate, children_fn)
            maxEval = max(maxEval, eval)
            alpha = max(alpha, eval)
            if beta <= alpha:
                break  # Beta cut-off
        return maxEval
    else:
        minEval = float('inf')
        for child in children_fn(node):
            eval = alpha_beta(child, depth - 1, alpha, beta, True, evaluate, children_fn)
            minEval = min(minEval, eval)
            beta = min(beta, eval)
            if beta <= alpha:
                break  # Alpha cut-off
        return minEval

# Example usage with a simple static tree
class Node:
    def __init__(self, value=None, children=None):
        self.value = value
        self.children = children or []

# Static evaluation function
def evaluate(node):
    return node.value

# Child function
def children_fn(node):
    return node.children

# Build a simple example tree
root = Node(children=[
    Node(children=[
        Node(value=3), Node(value=5), Node(value=6)
    ]),
    Node(children=[
        Node(value=9), Node(value=1), Node(value=2)
    ]),
    Node(children=[
        Node(value=0), Node(value=-1), Node(value=4)
    ])
])

# Start alpha-beta pruning
best_value = alpha_beta(root, depth=3, alpha=float('-inf'), beta=float('inf'), maximizingPlayer=True,
                        evaluate=evaluate, children_fn=children_fn)
print("Best value:", best_value)
