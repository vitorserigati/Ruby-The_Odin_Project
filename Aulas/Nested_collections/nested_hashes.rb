vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}

puts vehicles[:alice][:year]
puts vehicles[:blake][:make]
puts vehicles[:caleb][:model]

#vehicles[:zoe][:year]
vehicles.dig(:zoe, :year)
#vehicles[:alice][:color]
vehicles.dig(:alice, :color)

puts vehicles.to_s
vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}

puts vehicles.to_s

vehicles[:dave][:color] = "red"

puts vehicles[:dave].to_s

vehicles.delete(:blake)

puts vehicles.to_s

vehicles[:dave].delete(:color)

puts vehicles.to_s

vehicles.select {|name, data| data[:year] >= 2020} #=> Returns another nested hash

vehicles.collect {| name, data | name if data[:year] >= 2020} #=> Returns the name anda 'nil' when it doesn't match

vehicles.collect {| name, data | name if data[:year] >= 2020}.compact #=> Returns what we need. The names and nothing else.

vehicles.filter_map {| name, data | name if data [:year] >= 2020} #=> Returns what we specified. It's a junction of both methods above

