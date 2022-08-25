## The each Method

    #each it can do anything. As you’ll see throughout this lesson, though, just because you can use #each to do just about anything doesn’t mean it’s always the best or most efficient tool for the job.

    Calling #each on an array will iterate through that array and will yield each element to a code block, where a task can be performed

    #each also works for hashes with a bit of added functionality. By default, each iteration will yield both the key and value individually or together (as an array) to the block depending on how you define your block variable.

## The each_with_index Method

    This method is nearly the same as #each, but it provides some additional functionality by yielding two block variables instead of one as it iterates through an array. The first variable’s value is the element itself, while the second variable’s value is the index of that element within the array. This allows you to do things that are a bit more complex.

## Map

    The #map method (also called #collect) transforms each element from an array according to whatever block you pass to it and returns the transformed elements in a new array.

## Select

    The #select method (also called #filter) passes every item in an array to a block and returns a new array with only the items for which the condition you set in the block evaluated to true.

## Reduce

    The #reduce method (also called #inject) reduces an array or hash down to a single object. You should use #reduce when you want to get an output of a single value.

    The first block variable in the #reduce enumerable (sum in this example) is known as the accumulator. The result of each iteration is stored in the accumulator and then passed to the next iteration. The accumulator is also the value that the #reduce method returns at the end of its work. By default, the initial value of the accumulator is the first element in the collection.

    We can also set a different initial value for the accumulator by directly passing in a value to the #reduce method
