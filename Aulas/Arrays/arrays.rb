num_array = [1, 2, 3, 4, 5]

num2_array = Array.new(3,7)

puts num_array.to_s

puts num2_array.to_s

str_array = ["This", "is", "a", "small", "array"]

str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
str_array.last(2)       #=> ["small", "array"]

puts num_array
puts num_array.push(6,7).to_s
num_array << 12

puts num_array.to_s

num_array.pop

puts num_array.to_s

num_array.unshift(0)

puts num_array.to_s

num_array.shift

puts num_array.to_s