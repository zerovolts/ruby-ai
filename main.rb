require "pry"
require_relative "neural_network"

ann = NeuralNetwork.from_node_structure([3, 4, 3])
ann2 = NeuralNetwork.new([
  [[0, 0, 0], [1, 1, 1], [0, 0, 0], [0, 0, 0]],
  [[0.5, 0.5, 0.5, 0.5], [0, 0, 0, 0], [0, 0, 0, 0]]
])

print ann2.compute([1, 1, 1])
