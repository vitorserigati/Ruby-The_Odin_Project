require 'msgpack'

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_msgpack
    MessagePack.dump({
                       name: @name,
                       age: @age,
                       gender: @gender
                     })
  end

  def self.from_msgpack(string)
    data = MessagePack.load(string)
    new(data['name'], data['age'], data['gender'])
  end
end

p = Person.new('David', 28, 'male')

p p.to_msgpack

p = Person.from_msgpack(p.to_msgpack)

puts "Name: #{p.name}"
puts "Age: #{p.age}"
puts "Gender: #{p.gender}"
