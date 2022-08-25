friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

puts friends.select{|friend| friend != "Brian"}

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }

puts responses.select {|person, response| response == "yes"}