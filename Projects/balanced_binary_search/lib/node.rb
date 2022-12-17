# frozen_string_literal: true

# Node Class for Binary Tree
class Node
  include Comparable

  attr_accessor :data, :right, :left

  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end

  def <=>(other)
    return @data <=> other if other.is_a? Integer

    @data <=> other.data
  end
end
