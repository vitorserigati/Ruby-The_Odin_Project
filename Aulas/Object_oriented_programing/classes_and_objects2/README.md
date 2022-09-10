# Class Methods

    Class methods are methods we can call directly on the class itself, without having to instantiate any objects. When defining a class method, we prepend the method name with the reserved word 'self.', like this:

```Ruby
  def self.what_am_i
    "I'm a GoodDog class!"
  end
```

# Class Variables

    Just as instance variables capture information related to specific instances of classes, we can create variables for an entire class that are appropriately named class variables. Class variables are created using two '@' symbols like so: @@ . Let's

```Ruby
  class GoodDog
    @@number_of_dogs = 0

    def initialize
      @@number_of_dogs += 1
    end

    def self.total_number_of_dogs
      @@number_of_dogs
    end
  end

  puts GoodDog.total_number_of_dogs   # => 0

  dog1 = GoodDog.new
  dog2 = GoodDog.new

  puts GoodDog.total_number_of_dogs   # => 2
```

# Constantes

When creating classes there may also be certain variables that you never want to change. You can do this by creating what are called <strong>constants</strong>. You define a constant by using an uppercase letter at the beginning of the variable name. While technically constants just need to begin with a capital letter, most Rubyists will make the entire variable uppercase.

```Ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age    #=> 28
```

Here we used the constat DOG_YEARS to calculate the age in dog years when we created the object, sparky. Note that we used the setter methods in the initialize method to initialize the @name and @age instance variables given to us by the attr_accessor method. We then used the age getter method to retrieve the value from the object.
DOG_YEARs is a variable that will never change for any reason so we use a constat. It is possible to reassign a new value to constats but Ruby will throw a warning.
