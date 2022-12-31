# frozen_string_literal: true

# Class node for board
class Node
  include Comparable
  attr_reader :x, :y
  attr_accessor :moves, :parent

  POSSIBLE_MOVE = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-2, 1], [-1, 2], [2, -1]].freeze

  def initialize(pos_x, pos_y)
    @x = pos_x
    @y = pos_y
    @moves = []
    @parent = nil
  end

  def <=>(other)
    [x, y].to_s <=> other.to_s if other.is_a? String
  end

  def put_moves(board)
    @moves = POSSIBLE_MOVE.map { |move| board[x + move[0]][y + move[1]] if valid_move?(move, board) }
                          .keep_if { |x| !x.nil? }
  end

  def valid_move?(move, board)
    (x + move[0]).between?(0, (board.size - 1)) && (y + move[1]).between?(0, (board[0].size - 1))
  end

  def to_s
    [x, y].to_s
  end

  def to_sym
    to_s.to_sym
  end

  def reset_parent
    @parent = nil
  end

  def pretty_print(pp)
    pp.object_address_group self do
      pp.breakable
      pp.text '@x='
      pp.pp @x
      pp.comma_breakable
      pp.text '@y='
      pp.pp @y
      pp.comma_breakable
      pp.text '@moves='
      test = []
      @moves.each { |a| test << a.to_s }
      pp.pp test
      pp.comma_breakable
      pp.text '@parent='
      parent.nil? ? (pp.pp parent) : (pp.pp parent.to_s)
      ## pp.text '@g_value'
      ## pp.pp @g_value
      ## pp.comma_breakable
      ## pp.text '@h_value'
      ## pp.pp @h_value
    end
  end

  alias inspect pretty_print_inspect
end
