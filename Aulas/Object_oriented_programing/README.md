#Object Oriented Programing

```Ruby

class Language                                              #=> Class name
  def initialize(name, creator)                             #=> Constructor
    @name = name                                            #=> Attributes
    @creator = creator                                      #=> @ before the variable means it's a instance variable
  end

  def description                                           #=> Method
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end                                                         #=> Block ending

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description

```

## Class Syntax

    A basic class consists only of the class keyword and the name of the class.
    #def initialize #=> constructor of the class
    DerivedClass < BaseClass  #=> inheritance

ex:

```Ruby
class ApplicationError
    def display_error
        puts "Error! Error!"
    end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

```

## Variables

    @ => instance variable
    $ => Global variable
    @@ => class variable

## Override
  
    To override a class method, just create the same method, but with different outputs

## Super

    The super keyword is used to call a method that has been overrided from the BaseClass
    It's usefull when we override the BaseClass method, but still need to use it's output.
    the super keyword must be used from inside of the method you're overridin

## Getters and Setters

    In ruby, we can add a attribute reader (Getter) and a attribute writer (setter) in order
    to change the values of a instance variable. 
    ex..:


```Ruby
    attr_reader :variable_name #getter
    attr_writer :variable_name #setter
    attr_accessor :variable_name #getter and setter
```

## Modules
    
    Modules are used to separate methods that doesn't belong to a specific class. 
    Much like classes, you create a module by calling module and the name of that
    module in CamelCase.
    Then write your functions and constants and finish it by calling end.

    In order to call a module constant or function, just type the module name
    followed by :: and the function/constant you want. ex..:

```Ruby
Math::PI
```
    Some modules need to be called before the interpreter understants what you want.
    To call a module, just 'require' it on the beginnign of the document.

```Ruby
require 'date'

puts Date.today
```

    We can include a module inside our classes. Just by typing 'include' and the module name
    This way we can use it's functions or constants inside our class, without calling it's
    name before. ex..:

```Ruby
class MyClass
  include Math

  def initialize(radians)
    @radians = radians
  end

  def cosine
    cos(@radians)
  end
end
```

    When a module is used to mix additional behavior and information into a class, 
    it’s called a mixin. Mixins allow us to customize a class without having to rewrite code!
