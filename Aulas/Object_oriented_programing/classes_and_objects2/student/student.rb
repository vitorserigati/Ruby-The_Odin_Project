# frozen_string_literal: true

# student class
class Student
  attr_accessor :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(person)
    @grade > person.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new('Joe', 10)
bob = Student.new('Bob', 20)

puts "Well Done, #{joe.name}!" if joe.better_grade_than?(bob)
puts "Well Done, #{bob.name}!" if bob.better_grade_than?(joe)
