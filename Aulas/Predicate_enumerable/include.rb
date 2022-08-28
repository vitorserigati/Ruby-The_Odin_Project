numbers = [5, 6, 7, 8, 9, 10]

puts numbers.include?(6)

puts numbers.include?(3)

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { | friend | friend != 'Brian'}

puts invited_list.include?('Brian')