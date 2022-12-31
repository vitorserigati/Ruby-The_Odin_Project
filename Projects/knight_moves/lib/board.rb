# frozen_string_literal: true

require_relative 'node'

# Board class
class Board
  attr_reader :coords

  def initialize
    @coords = fill_nodes
  end

  def knight_moves(starting_pos, ending_pos)
    starting_node = node_from_coords(starting_pos)
    ending_node = node_from_coords(ending_pos)
    moves = 0
    open_set = [starting_node]
    closed_set = []
    return message(moves, starting_node) if starting_node.eql? ending_node

    until open_set.empty?
      current_node = open_set.shift
      current_node.moves.each do |move|
        move.parent = current_node unless closed_set.include? move
        if move.eql? ending_node
          parent = get_parent(move)
          moves = parent.size - 1
          return puts message(moves, parent)
        else
          open_set << move unless closed_set.include? move
        end
      end
      closed_set << current_node
    end
  end

  private

  def get_parent(node)
    parent = []
    c_node = node
    until c_node.nil?
      parent << c_node.to_s
      c_node = c_node.parent
    end
    reset
    parent.reverse
  end

  def reset
    coords.each { |x| x.each(&:reset_parent) }
  end

  def message(moves, node)
    puts "Moves = #{moves}\nNodes visited = #{node}"
  end

  def node_from_coords(coord)
    x, y = coord
    coords[x][y]
  end

  def fill_nodes
    board = Array.new(8) { Array.new(8) }
    8.times do |x|
      8.times do |y|
        board[x][y] = Node.new(x, y)
      end
    end
    fill_moves(board)
    board
  end

  def fill_moves(board)
    board.each do |x|
      x.each do |node|
        node.put_moves(board)
      end
    end
  end
end
