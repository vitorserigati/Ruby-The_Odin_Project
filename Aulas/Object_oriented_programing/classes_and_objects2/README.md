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

# Constants

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

Here we used the constant DOG_YEARS to calculate the age in dog years when we created the object, sparky. Note that we used the setter methods in the initialize method to initialize the @name and @age instance variables given to us by the attr_accessor method. We then used the age getter method to retrieve the value from the object.
DOG_YEARS is a variable that will never change for any reason so we use a constant. 
It is possible to reassign a new value to constants but Ruby will throw a warning.

# The to_s Method

  The to_s instance method comes built in to every class in Ruby. In fact, we have been using it all along. For example, suppose we have the GoodDog class from above, and the sparky object as well from above.

  ```Ruby
  puts sparky  # => #<GoodDog:0x007fe542323320>
  ```
  What's happening here is that the puts method automatically calls to_s on its argument, which in this case is the sparky object. In other words puts sparky is equivalent to puts sparky.to_s. The reason we get this particular output lies within the to_s method in Ruby. By default, the to_s method returns the name of the object's class and an encoding of the object id.
    Note: puts method calls to_s for any argument that is not an array. For an array, it writes on separate lines the result of calling to_s on each element of the array.

  To test this, we can add a custom to_s method to our GoodDog class, overriding the default to_s that comes with Ruby.

  ```Ruby
  class GoodDog
    DOG_YEARS = 7

    attr_accessor :name, :age

    def initialize(n, a)
      @name = n
      @age = a * DOG_YEARS
    end

    def to_s
      "This dog's name is #{name} and it is #{age} in dog years."
    end
  end

  puts sparky  # => This dog's name is Sparky and it is 28 in dog years. 
  ```

  There's another method called p that's very similar to puts, except it doesn't call to_s on its argument; it calls another built-in Ruby instance method called inspect. The inspect method is very helpful for debugging purposes, so we don't want to override it.
  
  ```Ruby
  p sparky  # => #<GoodDog:0x007fe54229b358 @name="Sparky", @age=28>
  ```

  This output implies that p sparky is equivalent to puts sparky.inspect.

  Besides being called automatically when using puts, another important attribute of the to_s method is that it's also automatically called in string interpolation. We've seen this before when using integers or arrays in string interpolation: 

  ```Ruby

  irb :001 > arr = [1, 2, 3]
  => [1, 2, 3]
  irb :002 > x = 5
  => 5
  irb :003 > "The #{arr} array doesn't include #{x}."
  => The [1, 2, 3] array doesn't include 5.
  ```

  Here, the to_s method is automatically called o n the arr array object, as well as the x integer object. We'll see if we can include our sparky object in a string interpolation: 

  ```Ruby
  irb :001 > "#{sparky}"
  => "This dog's name is Sparky and it is 28 in dog years."
  ```
