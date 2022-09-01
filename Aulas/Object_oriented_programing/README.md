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

    In ruby, we can add a attribute reader (Getter) and a attribute writer (setter) in order to change the values of a instance variable. 
    ex..:


```Ruby
    attr_reader :variable_name #getter
    attr_writer :variable_name #setter
    attr_accessor :variable_name #getter and setter
```
