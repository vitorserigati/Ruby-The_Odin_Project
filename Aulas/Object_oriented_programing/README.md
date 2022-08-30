# Object Oriented Programing

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
    class_name < moter_class  #=> inheritance

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

##
