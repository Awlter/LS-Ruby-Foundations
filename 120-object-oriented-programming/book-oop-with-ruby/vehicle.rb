require 'pry'

module Driftable
  def drift
    puts "#{self} is drifting"
  end
end

class Vehicle
  @@number_of_objects = 0

  attr_accessor :color
  attr_reader :year

  def self.number_of_objects
    @@number_of_objects
  end

  def age
    "Your #{@model} is #{calculate_age} old."
  end

  def speed_up(number)
    @current_speed += number
    puts "You pushed the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push"
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(new_color)
    self.color = new_color
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def to_s
    "My car is a #{color}, #{year}, #{@model}"
  end

  def initialize(year, model)
    @year = year
    @model = model
    @@number_of_objects += 1
  end

  private

  def calculate_age
    Time.new.year - year
  end
end

class MyCar < Vehicle
  include Driftable

  NUMBER_OF_DOORS = 4

  def initialize(year, model, color)
    super(year, model)
    @color = color
    @current_speed = 0
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def initialize(year, model, color)
    super(year, model)
    @color = color
    @current_speed = 0
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
binding.pry