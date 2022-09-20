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

# More about self

```Ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
end
```

Use self when calling setter methods from within the class. In our earlier example we showed that self was necessary in order for our change_info method to work properly. We had to use self to allow Ruby to disambiguate between initializing a local variable and calling a setter method.

Use self for class method definitions.

This is the standard GoodDog class, and we're using self whenever we call an instance method from within the class. We know the rule to use self. When an instance method uses self from within the class, self references the calling object.

The other place to use self, is when we're defining class methods, like this:

```Ruby
class MyAwesomeClass
  def self.this_is_a_class_method
  end
end
```

When self is prepended to a method definition, it's defining a <strong>class method</strong>.

```Ruby
class GoodDog
  puts self
end
```

If you run the good_dog.rb file with the GoodDog class definition, you'll see that GoodDog is output. Thus, you can see that using self inside a class but outside an instance method refers to the class itself. Therefore, a method definition prefixed with self is the same as defining the method on the class. That is, def self.a_method is equivalent to def GoodDog.a_method. That's why it's a class method; it's actually being defined on the class.

To be clear...

  <ol>
  <li>self, inside of an instance method, references the instance (object) that called the method - the calling object.
  Therefore, self.weight= is the same as sparky.weigth=, in our example.</li>
  <li>self, outside of an instance method, references the class and can be used to define class methods. Therefore if we were to define a name class method, def self.name=(n) is the same as def GoodDog.name=(n)</li>
  </ol>

Thus, we can see that self is a way of being explicit about what our program is referencing and what our intentions are as far as behavior. self changes depending on the scope it's used in. So pay attention to see if you're inside an instance method or not. self is a tricky concept to grasp in the beginning, but the more often you see its use, the more you will understand object oriented programming. If the explanations don't quite make sense, just memorize those two rules above for now.

# Class Inheritance

  Here, we're extracting the speak method to a superclass Animal, and we use inheritance to make that behavior available to GoodDog and Cat classes.

  ```Ruby
  class Animal
    def speak
      "Hello!"
    end
  end

  class GoodDog < Animal
  end

  class Cat < Animal
  end

  sparky = GoodDog.new
  paws = Cat.new

  puts sparky.speak   # => Hello!
  puts paws.speak     # => Hello!
  ```

  We use the < symbol to signify that the GoodDog class is inheriting from the Animal class. this means that all of the methods in the Animal class are available to the GoodDog class for use. We also created a new class called Cat that inherits from Animal as well. We've eliminated the speak method from the GoodDog class in order to use the speak method from Animal.

  When we run this code, we see the correct output. Both classes are now using the superclass Animal's speak method.
  But what if we want to use the original speak method from the GoodDog class only. Let's add it back and see what happens.

  ```Ruby
  class Animal
    def speak
      "Hello!"
    end
  end

  class GoodDog < Animal
    attr_accessor :name

    def initialize(n)
      self.name = n
    end

    def speak
      "#{self.name} says arf!"
    end
  end

  class Cat < Animal
  end

  sparky = GoodDog.new("Sparky")
  paws = Cat.new

  puts sparky.speak           # => Sparky says arf!
  puts paws.speak             # => Hello!
  ```

  In the GoodDog class, we're overriding the speak method in the Animal class because Ruby checks the object's class first for the method before it looks in the superclass. That means when we wrote the code sparky.speak, it first looked at sparky's class, which is GoodDog. It found the speak method there and used it. When we wrote the code paws.speak, Ruby first looked at paw's class, which is Cat. It did not find a speak method there, so it continued to look in Cat's superclass, Animal. It found a speak method Animal, and used it.

  Inheritance can be a great way to remove duplication in your code base. There is an acronym that you'll see often in the Ruby community, "DRY". This stands for "Don't Repeat Yourself". It means that if you find yourself writing the same logic over and over again in your programs, there are ways to extract that logic to one place for reuse."

# Super

  Ruby provides the super keyword to call methods earlier in the method lookup path. When called from within a method, it searches the method lookup path for a method with the same name, then invokes it.

  ```Ruby
  class Animal
    def speak
      "Hello!"
    end
  end

  class GoodDog < Animal
    def speak
      super + " from GoodDog class"
    end
  end

  sparky = GoodDog.new
  sparky.speak        # => "Hello! from GoodDog class"
  ```
  In the above example, we've created a simple Animal class with a speak instance method. We then created GoodDog which subclasses Animal also with a speak instance method to override the inherited version. However, in the subclass' speak method we use super to invoke the speak method from the superclass, Animal, and then we extend the functionality by appending some text to the return value.

  Another more common way of using super is with initialize.

  ```Ruby
  class Animal
    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end

  class GoodDog < Animal
    def initialize(color)
      super
      @color = color
    end
  end

  bruno = GoodDog.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
  ```

  The interesting concept we want to explain is the use of super in the GoodDog class. In this example, we're using super with no arguments. However, the initialize method, where super is being used, takes an argument and adds a new twist to how super is invoked. Here, in addition to the default behavior, super automatically forwards the arguments that were passed to the method from which super is called (initialize method in GoodDog class). At this point, super will pass the color argument in the initialize defined in the subclass to that of the Animal superclass and invoke it. That explains the presence of @name="brown" when the bruno instance is created. Finally, the subclass' initialize continues to set the @color instance variable.

  When called with specific arguments, eg. super(a, b), the specified arguments will be sent up the method lookup chain.

  ```Ruby
  class BadDog < Animal
    def initialize(age, name)
      super(name)
      @age = age
    end
  end

  BadDog.new(2, "bear")        # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
  ```

  Consequently, in this example when a BadDog class is created, the passed in name argument ("bear") is passed to the superclass and set to the @name instance variable.

  There's one last twist. If you call super() exactly as shown -- with parentheses -- it calls the method in the superclass with no arguments at all. If you have a method in your superclass that takes no arguments, this is the safest -- and sometimes the only -- way to call it:

  ```Ruby
  class Animal
    def initialize
    end
  end

  class Bear < Animal
    def initialize(color)
      super()
      @color = color
    end
  end

  bear = Bear.new("black")        # => #<Bear:0x007fb40b1e6718 @color="black">
  ```

  If you forget to use the parentheses here, Ruby will raise an ArgumentError exception since the number of arguments is incorrect.

# Mixing in Modules

  ```Ruby
  module Swimmable
    def swim
      "I'm swimming!"
    end
  end

  class Animal; end

  class Fish < Animal
    include Swimmable         # mixing in Swimmable module
  end

  class Mammal < Animal
  end

  class Cat < Mammal
  end

  class Dog < Mammal
    include Swimmable         # mixing in Swimmable module
  end
  
  sparky = Dog.new
  neemo  = Fish.new
  paws   = Cat.new

  sparky.swim                 # => I'm swimming!
  neemo.swim                  # => I'm swimming!
  paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>
  ```

  Using modules to group common behaviors allows us to build a more powerful, flexible and DRY design.

  Note: A common naming convention for Ruby is to use the "able" suffix on whatever verb describes the behavior that the module is modeling. You can see this convention with our Swimmable module. Likewise, we could name a module that describes "walking" as Walkable. Not all modules are named in this manner, however, it is quite common.

# Inheritance vs Modules

  Class inheritance is the traditional way to think about inheritance. One type inherits the behaviors of another type. The result is a new type that specializes the type of the superclass. Thye o ther form is sometimes called interface inheritance: this is where mixin modules come into play. the class doesn't inherit from another type, but instead, inherits the interface provided by the mixin module. In this case, the result type is not a specialized type with respect to the module.
  When choosing between inheritance and mixin, there are a couple of things to consider.
  - You can only subclass (class inheritance) from one class. You can mix in as many modules (interface inheritance) as you'd like.
  - If there's an "is-a" relationship, class inheritance is usually the correct choice. If there's a "has-a" relationship, interface inheritance is generally a better choice. For example, a dog "is an" animal and it "has an" ability to swim.
  - You cannot instantiate modules (i.e., no object can be created from a module). Modules are used only for namespacing and grouping common methods together.
