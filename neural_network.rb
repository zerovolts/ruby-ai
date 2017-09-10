require_relative "weight_layer"

class NeuralNetwork
  attr_reader :node_layers, :weight_layers

  def initialize(weight_layers)
    node_structure = Array.new(weight_layers.length + 1).map.with_index do |_, index|
      if weight_layers[index]
        weight_layers[index][0].length
      else
        weight_layers[index - 1].length
      end
    end
    @node_layers = node_structure.map { |layer_count| Array.new(layer_count, 0) }
    @weight_layers = weight_layers.map { |layer| WeightLayer.new(layer) }
  end

  def self.from_node_structure(node_structure)
    weight_layers = Array.new(node_structure.length - 1).map.with_index do |_, index|
      Array.new(node_structure[index + 1]) { Array.new(node_structure[index], 0) }
    end
    NeuralNetwork.new(weight_layers)
  end

  def inputs=(inputs)
    if inputs.length == @node_layers.first.length
      @node_layers[0] = inputs
    else
      throw "Array length does not equal NeuralNetwork input length"
    end
  end

  def outputs
    @node_layers.last
  end

  def compute
    @weight_layers.map.with_index do |weight_layer, index|
      @node_layers[index + 1] = weight_layer.calculate(@node_layers[index])
    end

    self
  end

  private

  # [1, 2, 3] -> [1, 1, 2, 2, 3, 3] -> [1, 2, 2, 3] -> [[1, 2], [2, 3]]
  def pair_up(array)
    array.reduce([]) do |total, cur|
      total << cur << cur
    end[1..-2].each.with_index.reduce([]) do |acc, (cur, i)|
      i % 2 == 0 ? acc << [cur, array[i + 1]]  : acc
    end
  end
end
