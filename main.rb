require "pry"
require_relative "neural_network"

ann = NeuralNetwork.from_node_structure([3, 4, 3])
ann2 = NeuralNetwork.new([
  [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]],
  [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
])

print ann.compute([2.3, 5.2, 8.1])
