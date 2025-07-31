import math
from collections import Counter

def entropy(data):
    labels = [row[-1] for row in data]
    total = len(labels)
    counts = Counter(labels)
    return -sum((count/total) * math.log2(count/total) for count in counts.values())

def info_gain(data, feature_index):
    total_entropy = entropy(data)
    values = set(row[feature_index] for row in data)
    weighted_entropy = 0
    for val in values:
        subset = [row for row in data if row[feature_index] == val]
        weighted_entropy += (len(subset)/len(data)) * entropy(subset)
    return total_entropy - weighted_entropy

def majority_class(data):
    labels = [row[-1] for row in data]
    return Counter(labels).most_common(1)[0][0]

def id3(data, features):
    labels = [row[-1] for row in data]
    if labels.count(labels[0]) == len(labels):
        return labels[0]
    if not features:
        return majority_class(data)

    gains = [info_gain(data, i) for i in range(len(features))]
    best_index = gains.index(max(gains))
    best_feature = features[best_index]

    tree = {best_feature: {}}
    values = set(row[best_index] for row in data)
    for val in values:
        subset = [row[:best_index] + row[best_index+1:] for row in data if row[best_index] == val]
        sub_features = features[:best_index] + features[best_index+1:]
        tree[best_feature][val] = id3(subset, sub_features)

    return tree

# Example usage:
data = [
    ['Sunny', 'Hot', 'High', 'No'],
    ['Sunny', 'Hot', 'High', 'No'],
    ['Overcast', 'Hot', 'High', 'Yes'],
    ['Rain', 'Mild', 'High', 'Yes'],
    ['Rain', 'Cool', 'Normal', 'Yes'],
    ['Rain', 'Cool', 'Normal', 'No'],
    ['Overcast', 'Cool', 'Normal', 'Yes'],
    ['Sunny', 'Mild', 'High', 'No'],
    ['Sunny', 'Cool', 'Normal', 'Yes'],
    ['Rain', 'Mild', 'Normal', 'Yes'],
    ['Sunny', 'Mild', 'Normal', 'Yes'],
    ['Overcast', 'Mild', 'High', 'Yes'],
    ['Overcast', 'Hot', 'Normal', 'Yes'],
    ['Rain', 'Mild', 'High', 'No']
]
features = ['Outlook', 'Temperature', 'Humidity']

tree = id3(data, features)
print(tree)
