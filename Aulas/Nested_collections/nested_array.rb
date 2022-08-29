test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
  ]

  teacher_mailboxes = [ 
    ["Adams", "Baker", "Clark", "Davis"],
    ["Jones", "Lewis", "Lopez", "Moore"],
    ["Perez", "Scott", "Smith", "Young"]
  ]

  puts teacher_mailboxes[0][0]

  puts teacher_mailboxes[1][0]

  puts teacher_mailboxes[2][0]

  puts teacher_mailboxes[0][-1]
  
  puts teacher_mailboxes[-1][0]

  puts teacher_mailboxes[-1][-2]

  puts teacher_mailboxes.dig(3,0).to_s

  puts teacher_mailboxes.dig(0, 4).to_s
  puts teacher_mailboxes.dig(0,0)

immutable = Array.new(3) {Array.new(2)}

puts immutable.to_s

immutable[0][0] = 1000

puts immutable.to_s

puts test_scores.to_s

test_scores << [100, 99, 98, 97]

puts test_scores.to_s

test_scores[0].push(100)

puts "-----------------------------"
puts test_scores.to_s

test_scores.pop

puts test_scores.to_s

test_scores[0].pop

puts test_scores.to_s

puts "--------------------------------------------------"

teacher_mailboxes.each_with_index do | row, row_index |
  puts "Row: #{row_index} = #{row}"
end

teacher_mailboxes.each_with_index do | row, row_index |
  row.each_with_index do | teacher, column_index |
    puts "Row: #{row_index} Column: #{column_index} = #{teacher}"
  end
end

teacher_mailboxes.flatten.each do | teacher |
  puts "#{teacher} is amazing!"
end

test_scores.any? do |scores|
  scores.all? {| score | score > 80}
end

test_scores.all? do |scores|
  scores.any? { |score| score > 80 }
end