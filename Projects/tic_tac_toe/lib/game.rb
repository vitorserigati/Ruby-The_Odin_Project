# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'rules'
# Game class
class Game
  include Rules

  @@game_instance = 0
  @@game_over = false

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
    until @@game_over
      position
      check_combos
      check_winner(@turn)
      game_over?
      change_turn
    end
    outcome
  end

  private

  def outcome
    if !@winner.nil?
      puts "Congratulations #{@winner}, you won!"
    else
      puts "It's a tie!"
    end
    @board.to_s
  end

  def position
    puts "Please #{@turn.name} chose a position (1-9) : "
    @board.to_s
    pos = gets.chomp.to_i - 1
    if pos.between?(0, 8) && position_valid?(pos)
      @board.put_symbol(@turn.symbol, pos)
    else
      position
    end
  end

  def game_over?
    !@winner.nil? || (@board.table.all? { |position| position != ' ' }) ? (@@game_over = true) : (@@game_over = false)
  end

  def change_turn
    @turn == @player1 ? (@turn = @player2) : (@turn = @player1)
  end

  def check_winner(player)
    winner = Rules::COMBOS.any? do |line|
      line.all? { |position| @board.table[position] == player.symbol }
    end
    @winner = player.name if winner
  end

  def check_combos
    Rules::COMBOS.any? do |line|
      line.all? { |position| @board.table[position] == @player1.symbol || @board.table[position] == @player2.symbol }
    end
  end
end
