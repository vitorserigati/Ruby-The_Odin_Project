# Board Class
class Board
  @@boards = 0
  attr_reader :table

  def initialize
    return unless @@boards.zero?

    @table = Array.new(9, ' ')
    @@boards += 1
  end

  def put_symbol(symbol, position)
    @table[position] == ' ' ? (@table[position] = symbol) : (puts 'Posição inválida, tente novamente')
  end

  def to_s
    puts "  #{@table[0]} | #{@table[1]} | #{@table[2]} \n"\
         " ---+---+---\n"\
         "  #{@table[3]} | #{@table[4]} | #{@table[5]} \n"\
         " ---+---+---\n"\
         "  #{@table[6]} | #{@table[7]} | #{@table[8]} \n"
  end
end
