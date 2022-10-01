# frozen_string_literal: true

# helper module to show rules and hints on the game
module Rules
  def self.show_rules
    puts 'This is a simple mastermind game'
    puts 'You must guess 4 colors in sequence'
    show_hint
  end

  def self.show_hint
    puts "\nIf the color you chose is not in the random generated list" \
     "\nYou'll see the number 2 in the same order you typed that color" \
     "\nOtherwise, you will see the number 1, if it is on the right spot" \
     "\nor number 0 if it is on the list, but not on the right place\n" \
  end
end
