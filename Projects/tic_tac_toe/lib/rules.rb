# frozen_string_literal: true

# Helper module for tictactoe rules
module Rules
  COMBOS = [
    [0, 1, 2], [3, 4, 5],
    [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

  def position_valid?(position)
    @board.table[position] == ' '
  end

  def self.display_guide
    puts 'This is a simple TicTacToe game.'
    puts 'The board is divided in 9 positions'
    puts 'Starting from the top left to bottom right'
    puts " 1 | 2 | 3 \n"\
         "---+---+---\n"\
         " 4 | 5 | 6 \n"\
         "---+---+---\n"\
         ' 7 | 8 | 9 '
  end
end
