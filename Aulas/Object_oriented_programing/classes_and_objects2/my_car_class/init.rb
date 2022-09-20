# frozen_string_literal: true

require_relative 'my_car'
require_relative 'my_truck'

my_truck = MyTruck.new(2022, 'Ford Tundra', 'White')
lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_off
lumina.current_speed
puts lumina.color
lumina.color = 'black'
puts lumina.color
puts lumina.year
lumina.spray_paint('red')

puts my_truck.can_tow?(2001)

puts lumina

MyCar.gas_mileage(13, 351)

puts Vehicle.ancestors
puts MyCar.ancestors
puts MyTruck.ancestors
puts lumina.age
