numbers = [21, 42, 303, 499, 550, 811]

puts numbers.any? {|number| number > 500}

puts numbers.any? {|number| number < 20}