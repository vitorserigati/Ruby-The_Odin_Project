# frozen_string_literal: true

# Class to control all vehicles atributes
class Vehicle
  attr_accessor :color
  attr_reader :year

  @@count = 0
  def initialize(year, model, color)
    @year = year.to_i
    @color = color
    @model = model
    @@count += 1
  end

  def speed_up(speed)
    @speed += speed
    puts "You've increased your speed by #{speed} Km/h"
  end

  def brake(speed)
    @speed -= speed
    puts "You're pushing the brake and decelerate #{speed} Km/h"
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

  def self.vehicle_count
    "There are #{@@count} vehicles"
  end

  def age
    "Your #{@model} is #{years_old} years old"
  end

  private

  def years_old
    Time.now.year - @year
  end
end
