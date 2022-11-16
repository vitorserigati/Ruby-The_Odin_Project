# frozen_string_literal: true

require 'json'

# Class with all methods for the game
class Hangman
  GAME_DICTIONARY = File.read('../dictionary.txt').split("\n")
  @@game_instance = 0

  attr_reader :secret

  def initialize
    return unless @@game_instance.zero?

    @secret = pick_secret
    @lifes = 6
    @player_word = ''
    @failed_char = []
  end

  def start
    decide_load_or_new
    show_game_state
    until @lifes.zero? || @player_word == @secret.join
      check_input
      show_game_state
    end
    puts "You lose. The correct word was: #{@secret.join}" if @lifes.zero?
    puts 'Congratulations, you guessed correctly!' if @secret.join == @player_word
  end

  private

  def decide_load_or_new
    puts "Você deseja iniciar um novo jogo, ou carregar um já existente? Digite: ('new' ou 'load')"
    input = gets.chomp
    case input
    when 'new'
      pick_secret
    when 'load'
      load_game
    end
  end

  def show_game_state
    puts %(
      You have #{@lifes} lifes remaining.
      Also, you have already tryed these letters: #{@failed_char}
      These are the letters you've guessed right: #{@player_word}
    )
  end

  def save_game
    game = { secret: @secret, lifes: @lifes, player_word: @player_word, failed_char: @failed_char }
    puts 'Digite um nome para o seu save: '
    file_name = gets.chomp.downcase
    Dir.mkdir('../save') unless Dir.exist?('../save')
    file_name = "../save/#{file_name}.json"
    File.open(file_name, 'w') do |file|
      file.puts game.to_json
    end
  end

  def load_game
    puts 'Escolha o save que deseja carregar: '
    options = Dir.children('../save') if Dir.exist?('../save')
    options&.each { |save| puts "#{save.split('.json')}\n" }
    saved = gets.chomp
    if options.include?("#{saved}.json")
      file = File.read("../save/#{saved}.json")
      file = JSON.parse(file)
      @secret = file['secret']
      @lifes = file['lifes']
      @player_word = file['player_word']
      @failed_char = file['failed_char']
    else
      puts 'Arquivo inexistente'
    end
  end

  def pick_secret
    @game_words = GAME_DICTIONARY.map { |word| word if word.length.between?(5, 12) }
    @game_words.reject! { |element| element.to_s.empty? }
    @secret = @game_words[rand(@game_words.length)].downcase.split('')
    @player_word = '_' * @secret.length
  end

  def check_input
    puts "Type a letter or full word. Or 'save' if you want to save your game: "
    input = gets.chomp.downcase
    if input == 'save'
      save_game
    elsif @secret.include?(input)
      @secret.each_with_index do |letter, index|
        @player_word[index] = input if letter == input
      end
    elsif @secret.join == input
      @player_word = input
    else
      @failed_char.push(input)
      @lifes -= 1
    end
  end
end
