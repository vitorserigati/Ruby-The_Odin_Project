friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]

friends.map {|friend| friend.upcase}

my_order = ["medium Big Mac", "medium fries", "medium Milkshake"]

my_order.map {|order| puts order.gsub("medium", "extra large")}

salaries = [1200, 1500, 1100, 1800]

salaries.map {|salary| salary - 700}