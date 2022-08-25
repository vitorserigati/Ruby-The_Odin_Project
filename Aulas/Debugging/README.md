## Debugging with Pry-byebug

Pry is a Ruby gem that provides you with an interactive REPL while your program is running. The REPL provided by Pry is very similar to IRB but has added functionality. The recommended Ruby gem for debugging is Pry-byebug and it includes Pry as a dependency. Pry-byebug adds step-by-step debugging and stack navigation.

To use Pry-byebug, you’ll first need to install it in your terminal by running gem install pry-byebug. You can then make it available in your program by requiring it at the top of your file with require 'pry-byebug'. Finally, to use Pry-byebug, you just need to call binding.pry at any point in your program.

To follow along with these examples save the code into a Ruby file (e.g., script.rb) and then run the file in your terminal (e.g., ruby script.rb)

```Ruby
require 'pry-byebug'

def isogram?(string)
original_length = string.length
string_array = string.downcase.split

binding.pry

unique_length = string_array.uniq.length
original_length == unique_length
end

isogram?("Odin")
```

When your code executes and gets to binding.pry, it will open an IRB-like session in your terminal. You can then use that session to check the values of anything within the scope of where you included binding.pry. However, keep in mind that any code written after the binding.pry statement will not have been evaluated during the Pry session.

For example, here original_length and string_array are in scope. However, unique_length is not in scope, because it is written after binding.pry and has not been evaluated yet.

Thus, adding a binding.pry line in our code is similar to creating a breakpoint in JavaScript.

To see this point in action, try running the following:

```Ruby
require 'pry-byebug'

def yell_greeting(string)
name = string

binding.pry

name = name.upcase
greeting = "WASSAP, #{name}!"
puts greeting
end

yell_greeting("bob")
```

During the session, if you check for the value of name, you will notice that you get back the value bob instead of BOB. What value do you think greeting will return? Yup, it will be nil. This is because name = name.upcase and greeting = "WASSAP, #{name}!" occurred after the binding.pry call and were never evaluated.

Using the same example above, you can use one of pry-byebug’s commands to figure out what name = name.upcase will return. You won’t need to quit the session or add another binding.pry beneath it. Enter next to step over to the next line.

```Ruby
 pry(main)> name
=> "bob"
 pry(main)> greeting
=> nil
 pry(main)> next

     5: def yell_greeting(string)
     6:   name = string
     7:
     8:   binding.pry
     9:
    10:   name = name.upcase
 => 11:   greeting = "WASSAP, #{name}!"
    12:   puts greeting
    13: end

 pry(main)> name
=> "BOB"
```

It stops after evaluating the next line. name now returns BOB. Calling next again will evaluate the following line. Try it out to know what greeting will return. Pry-byebug has a few more commands, play around with them to get a feel of what they do. You can find the commands with a short description of what they do here.

As you can see, using Pry-byebug for debugging achieves the same outcome as puts debugging: it allows you to confirm the assumptions you have about particular parts of your code. If your code is complex, Pry-byebug will probably allow you to debug quicker thanks to its interactive runtime environment. In such scenarios, Pry-byebug will be easier to interact with than having to add puts statements everywhere and re-running your code each time.
