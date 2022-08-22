# Truth or false:

    The only false values in Ruby are the values nil and false themselves. Everything else is considered true. Even the string "false" is true in conditional expressions!

## Operators

    ==  (equals)                     #=> Returns true if the values are equal.
    !=  (not equals)                 #=> Returns true if the values are different.
    >   (greater than )              #=> true if the value on the left is greater than the value on the rigth.
    <   (less than)                  #=> true if the value on the left is lesser than the value on the rigth.
    >=  (greater than or equal to)   #=> true if the value on the left is greater or equal than the value on the right.
    <=  (less than or equal to)      #=> true if the value on the left is lesser or equal than the value on the rigth.
    .eql?()                          #=> checks both value type and actual value.
    .equal?()                        #=> Checks whether both values are the exact same object in memory.
    <=> (spaceship operator)         #=> returns a number of the comparison (-1, 0, 1) if left is less, equal our greater (in order).

## Logical Operators

    && (and)            #=> Returns true if both expressions are true.
    || (or)             #=> Returns true if one of expressions is true.
    !  (not)            #=> inverts the return. If it's true, become false. And vice-versa.

## case operator

    Case statements process each condition in turn, and if the condition returns false, it will move onto the next one until a match is found. An else clause can be provided to serve as a default if no match is found.
    If in need to do some more complex code manipulation, you can remove the then keyword and instead place the code to be executed on the next line.

## Unless Statement

    An unless statement works in the opposite way as an if statement: it only processes the code in the block if the expression evaluates to false.

## Ternary Operator

    The ternary operator is a one-line if...else statement that can make your code much more concise.
    If your conditional statements are complicated, then using an if...else statement can help to make your code more readable. Remember, above all else, your code needs to be readable and understandable by other people.
