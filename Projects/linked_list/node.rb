# frozen_string_literal: true

# node class for linked list
class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @next_node = next_node
    @value = value
  end
end
