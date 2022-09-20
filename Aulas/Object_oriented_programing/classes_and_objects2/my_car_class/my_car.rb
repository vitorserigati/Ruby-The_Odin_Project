# frozen_string_literal: true

require_relative 'vehicle'
# class made to control cars behavior
class MyCar < Vehicle
  DOORS = 4
  def initialize(model, color, year)
    super(model, color, year)
    @speed = 0
  end

  def to_s
    "The car #{@model} made on the year #{@year} has the color #{@color} and is moving at #{@speed} Km/h"
  end
end
