my_numbers = [5, 6, 7, 8]

puts my_numbers.reduce {|sum, number | sum += number}

puts my_numbers.reduce(1000) {|sum, number | sum += number}

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end