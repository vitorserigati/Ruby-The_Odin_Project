# frozen_string_literal: true

require_relative 'towable'
require_relative 'vehicle'
# Class destinated to control trucks behavior
class MyTruck < Vehicle
  include Towable
  DOORS = 2
  def initialize(model, year, color)
    super(model, year, color)
    @speed = 0
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "The truck #{@model} made on the year #{@year} has the color #{@color} and is moving at #{@speed} Km/h"
  end
end
