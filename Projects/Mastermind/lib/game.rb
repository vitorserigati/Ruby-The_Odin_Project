# frozen_string_literal: true

require_relative 'rules'

# Main game class
class Game
  include Rules

  def initialize
    @possible_colors = { '1' => 'blue', '2' => 'yellow', '3' => 'green', '4' => 'orange', '0' => 'red' }
    @colors = %w[]
    @turns = 0
    @player_guess = %w[]
    @result = []
    randomize_colors
  end

  def play
    while @turns < 17 && @result != [1, 1, 1, 1]
      player_guesses
      check_right_rows
      puts @result.to_s
      Rules.show_hint
    end
    puts "\nYou Win!\n" if @result == [1, 1, 1, 1]
    puts "\nGame Over! Try again...\n" if @result != [1, 1, 1, 1]
  end

  private

  def randomize_colors
    4.times do
      num = rand(0..4).to_s
      @colors.push(@possible_colors[num])
    end
  end

  def player_guesses
    @player_guess = []
    4.times do
      @player_guess.push(player_input)
    end
  end

  def player_input
    puts "\nChose your color: #{@possible_colors.values}\n"
    input = gets.chomp.downcase.gsub(/\s+/, '')
    if @possible_colors.values.include?(input)
      input
    else
      puts "\nEssa cor não está disponível."
      player_input
    end
  end

  def check_right_rows
    @player_guess.each_with_index do |color, index|
      @result[index] = 1 if color == @colors[index]
      @result[index] = 0 if color != @colors[index]
      @result[index] = 2 unless @colors.include?(color)
    end
  end
end
