## Strings

=============================================================================================================

### Concatenation

    "welcome" + "to" +
    "odin"  #=> "welcome to odin"

    "welcome" << "to" <<"odin" #=> "welcome to odin"

    "welcome".concat("to").concat("odin")  #=> "welcome to odin"

### Substrings

    "hello"[0]     #=> "h"

    "hello"[0..1]  #=> "he"

    "hello"[0, 4]  #=> "hell"

    "hello"[-1]    #=> "o"

### Scape Character

Works only on double quotation marks

    \\ #=> outputs a backlash on the string

    \b #=> backspace

    \r #=> Carriage return (returns the cursor to the beginning of the line)

    \n #=> Newline

    \s #=> space

    \t #=> tab

    \" #=> double quotation mark

    \' #=> single quotation mark

    "some text #{variable_name}" #=> interpolation

### Common String Methods

    .capitalize #=> first letter becomes Uppercase

    .include?() #=> Returns true or false if the word ou text includes given argument

    .upcase #=> whole text to uppercase

    .downcase #=> whole text to downcase

    .empty? #=> returns false if text exists

    .length #=> returns the length of the string

    .reverse #=> reverse the text

    .split() #=> splits the text in the given argument

    .strip #=> removes spaces on the beginning and end of the string

    "he77o".sub("7", "l")  #=> "hel7o" change the first found target for the given arg

    .gsub()  #=> changes all target for the given arg

    .prepend() #=> adds at the beginning of the text

    .to_s #=> converts other objects to string

### Symbols

To create a symbol, simply put a colon at the beginning of a text

    :my_symbol

### Bools

    true
    false
    nil
