# frozen_string_literal: true

puts 'Type your age: '

age = gets.to_i
response = age < 18 ? 'You still have your entire life ahead of you.' : "You're all grown up."
puts response #=> "You're all grown up."



