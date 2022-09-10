require_relative 'my_car'

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
