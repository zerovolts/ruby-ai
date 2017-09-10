require "pry"

class WeightLayer
  attr_reader :weight_groups

  def initialize(weight_groups)
    @weight_groups = weight_groups
  end

  def self.fill(input_node_count, output_node_count, fill=0)
    WeightLayer.new(Array.new(output_node_count) { Array.new(input_node_count, fill) })
  end

  def calculate(input_nodes)
    @weight_groups.map.with_index do |weight_group, group_index|
      weight_group.map.with_index do |weight, weight_index|
        input_nodes[weight_index] * weight
      end.reduce(:+) / input_nodes.length.to_f
    end
  end
end
