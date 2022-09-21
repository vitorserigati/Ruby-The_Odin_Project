# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
# Game class
class Game
  @@game_instance = 0
  @@game_over = false

  COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
  def initialize(player1, player2)
    return unless @@game_instance.zero?

    @winner = nil
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @@game_instance += 1
    @turn = @player1
  end

  def play
    while @@game_over == false
      @board.display_board
      puts 'Chose a position(0-8)'
      @board.put_symbol(@turn.symbol, gets.chomp.to_i)
      change_turn
      check_combos
      check_winner(@turn)
    end
  end

  private

  def game_over?
    @winner.nil? ? (@@game_over = false) : (@@game_over = true)
  end

  def change_turn
    @turn == @player1 ? (@turn = @player2) : (@turn = @player1)
    puts "This is the #{@turn.name}'s turn!\nMake your move: "
    puts 'Select your position(0-8)'
  end

  def check_winner(player)
    winner = COMBOS.any? do |line|
               line.all? { |position| @board.table[position] == " #{player.symbol} " }
             end
    @winner = player.name if winner
  end

  def check_combos
    COMBOS.any? do |line|
      line.all? { |position| @board.table[position] == " #{@player1.symbol} " || @board.table[position] == " #{@player2.symbol} " }
    end
  end
end
player1 = Player.new('Vitor', 'x')
player2 = Player.new('henrique', 'o')
game = Game.new(player1, player2)


game.play