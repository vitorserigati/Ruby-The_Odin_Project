puts "Please, enter a number"

test_true = gets.chomp.to_i

if test_true < 2
  puts "yes. #{test_true} is less than 2"
end


#when code is 1 line length, we can use this format instead
puts "\nyes. #{test_true} is less than 2\n" if test_true < 2

#if else elsif

if test_true <= 2
  puts "#{test_true} is less than 2"
elsif test_true > 2 && test_true < 5 
  puts "#{test_true} is higher than 2 but lesser than 5"
else
  puts "#{test_true} is equal or higher than 5"
end