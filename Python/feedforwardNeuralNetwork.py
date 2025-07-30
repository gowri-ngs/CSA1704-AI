import numpy as np

# A simple feed-forward neural network class
class NeuralNetwork:
    def __init__(self, input_size, hidden_size, output_size, learning_rate=0.1):
        # Initialize weights and biases with random values
        self.weights1 = np.random.randn(input_size, hidden_size)
        self.weights2 = np.random.randn(hidden_size, output_size)
        self.learning_rate = learning_rate

    def sigmoid(self, x):
        """Sigmoid activation function"""
        return 1 / (1 + np.exp(-x))

    def sigmoid_derivative(self, x):
        """Derivative of the sigmoid function"""
        return x * (1 - x)

    def feedforward(self, X):
        """Perform a feedforward pass"""
        # Calculate activation of the hidden layer
        self.layer1_activation = self.sigmoid(np.dot(X, self.weights1))
        # Calculate the output of the network
        output = self.sigmoid(np.dot(self.layer1_activation, self.weights2))
        return output

    def backpropagate(self, X, y, output):
        """Perform backpropagation and update weights"""
        # Calculate the error and delta for the output layer
        output_error = y - output
        output_delta = output_error * self.sigmoid_derivative(output)

        # Calculate the error and delta for the hidden layer
        layer1_error = output_delta.dot(self.weights2.T)
        layer1_delta = layer1_error * self.sigmoid_derivative(self.layer1_activation)

        # Calculate weight updates
        weights2_update = self.layer1_activation.T.dot(output_delta)
        weights1_update = X.T.dot(layer1_delta)

        # Update the weights
        self.weights2 += self.learning_rate * weights2_update
        self.weights1 += self.learning_rate * weights1_update

    def train(self, X, y, epochs):
        """Train the network for a number of epochs"""
        for _ in range(epochs):
            output = self.feedforward(X)
            self.backpropagate(X, y, output)

    def predict(self, X):
        """Make a prediction for a given input"""
        return self.feedforward(X)

# Example of how to use the Neural Network
if __name__ == "__main__":
    # Sample dataset (XOR problem)
    # Input data (features)
    X = np.array([[0, 0], [0, 1], [1, 0], [1, 1]])
    # Output data (labels)
    y = np.array([[0], [1], [1], [0]])

    # Create a neural network with 2 input neurons, 4 hidden neurons, and 1 output neuron
    nn = NeuralNetwork(input_size=2, hidden_size=4, output_size=1)

    # Train the neural network
    nn.train(X, y, epochs=10000)

    # Make predictions on the training data
    predictions = nn.predict(X)

    print("Predictions after training:")
    print(predictions)

    # Test with a new data point
    print("\nPrediction for [1,0]:")
    new_prediction = nn.predict(np.array([[1,0]]))
    print(new_prediction)