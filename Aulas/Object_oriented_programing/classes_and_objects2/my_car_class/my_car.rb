# frozen_string_literal: true

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(speed)
    @speed += speed
    puts "You've increased your speed by #{speed} Km/h"
  end

  def brake(speed)
    @speed -= speed
    puts "You're pushing the brake and deceçerate #{speed} Km/h"
  end

  def shut_off
    @speed = 0
    puts 'Lets stop this bad boy!'
  end

  def current_speed
    puts "You're now going #{@speed} Km/h"
  end

  def spray_paint(color)
    @color = color
    puts "You've got a nice new color! This #{color} is awesome!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "The car #{@model} made on the year #{@year} has the color #{@color} and is moving at #{@speed} Km/h"
  end
end
