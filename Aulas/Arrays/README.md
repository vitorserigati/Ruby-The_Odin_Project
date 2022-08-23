## Creating Arrays.

    Assign a " [] " to a variable. Or a list of itens. ex.: num_array = [1, 2, 3, 4, 5] or str_array = ["This", "is", "a", "small", "array"]

    Arrays can also be created by calling the Array.new method. When called, one can also include up to 2 optional arguments (itial size and default value).

## Accessing Elements

    Accessing a specific element within an array is as simple as calling myArray[x], where x is the index of the element you want. Calling an invalid position will result in nil. Ruby also allows the use of negative indices, which return elements starting from the end of an array, starting at [-1].

    Ruby also provides the #first and #last array methods. Im addition, these methods can take an integer argument, e.g., myArray.first(n) or myArray.last(n), which will return a new array that contains the first or last n elements of myArray, respectivelty.

## Adding and Removing Elements

    Adding an element to an existing array can be done by using the #push method or the shovel operator <<. Both methods will add elements to the end of an array and return that array with the new elements. The #pop method will remove the element at the end of an array and return the element that was removed.

    The methods #shift and #unshift are used to add and remove elements at the beginning of an array. The #unshift method adds elements to the beginning of an array and returns that array (much like #push). The #shift method removes the first element of an array and returns that element (much like #pop).

    #pop and #shift can take integer arguments.
