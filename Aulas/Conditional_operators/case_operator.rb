puts "Type your grade(A-F)"

grade = gets.chomp.upcase

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when "A" then "Hell yeah!"
  when "B" then "Almost there!"
  when "C" then "Not this time, bro"
  when "D" then "Don't tell your mother."
  else "'YOU SHALL NOT PASS!' -Gandalf"
end

puts did_i_pass

case grade
when 'A'
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when 'D'
  puts "Better luck next time"
  can_i_retire_soon = false
else
  puts "'YOU SHALL NOT PASS!' -Gandalf"
  fml = true
end