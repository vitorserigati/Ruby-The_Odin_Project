friends = ["Gaby", "Isabel", "Chris", "Murilo"]

friends.each{ |friend| puts "hello, " << friend }


my_array = [1, 2]

my_array.each do | num |
  num *= 2
  puts "The new number is: #{num}"
end

my_hash = { "one" => 1, :two => 2}

my_hash.each{|key, value| puts "#{key} is #{value}"}

my_hash.each{|pair| puts "the pair is: #{pair}"}