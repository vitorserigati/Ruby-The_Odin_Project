## Nested Arrays

    Arrays can contain any type of data, including other arrays. An array that contains other arrays is called a nested array, or a multidimensional array.

    Nested arrays can be useful to store groups of similar data or positional data.

### Accessing Elements

    Accessing a specific element within a nested array is done by calling calling array[x][y], where x is the index of the nested element and y is the index inside of the nested element.
    You can also use negative indices to return elements from the end of an array, starting at [-1].
    If you try to access an index of a nonexistent nested element, it will raise an NoMethodError, because the nil class does not have a [] method. However, just like a regular array, if you try to access a nonexistent index inside of an existing nested element, it will return nil.
    If you want a nil value returned when trying to access an index of a nonexistent nested element, you can use the #dig method. This method can also be used when accessing a nonexistent index inside of an existing nested element.

### Creating a Nested Array

    To create an array of mutable objects (string, array, hash, etc), you will need to pass the default value for Array.new via a block, using curly braces, instead of the second optional argument. The code in the block gets evaluated for every slot in the array, creating multiple objects to initialize the array with, rather than references to the same object.

### Adding and Removing Elements

    You can add another element to the end of nested array using the #push method or the shovel operator <<. If you want to add an element to a specific nested array, you will need to specify the index of the nested array.
    Using this similar syntax, you can add or remove elements from the entire nested array or from a specific nested element.

### Iterating over a nested array

    Let’s break down how to iterate over a nested array using the #each_with_index method. I find it helpful to think of a nested array as having rows and columns. Each row is the nested element and each column is the index of the nested element. When we iterate over the teacher_mailboxes example, each element will be one row.
    To iterate over the individual elements inside of each row, you will need to nest another enumerable method inside.
    Although these examples are a bit contrived, it is important to note that if we only need each teacher’s name it would be beneficial to use #flatten before iterating.

## Nested Hashes

    The hashes that you’ve seen so far have single key/value pairs. However, just like arrays, they can be nested, or multidimensional. Nested hashes are a very common way to store complex associated data.

### Accessing Data

    Accessing a specific element in a nested hash is very similar to a nested array. It is as simple as calling hash[:x][:y], where :x is the key of the hash and :y is the key of the nested hash.
    Similar to nested arrays, if you try to access a key in a nonexistent nested hash, it will raise an NoMethodError, therefore you may want to use the #dig method. As expected, if you try to access a nonexistent key in an existing nested hash, it will return nil.

### Adding and removing Data

    You can add more nested hashes, just like a regular hash.
    To add a new key/value pair to a nested hash, specify the key of the nested hash right before naming the new key.
    Deleting one of the nested hashes will be just like a regular hash.
    To delete one of the key/value pairs inside of a nested hash, you first specify the key of the hash.

## Methods

    There are many helpful methods to use with nested hashes. Once you know what data you need from a nested hash, I have found that browsing through the documentation and experimenting with them in IRB is the best way for me to understand how they work.

    Let’s look at an example using the vehicles nested hash. Let’s say that we want to know who owns vehicles that are from 2020 or newer. At first glance in the documentation, it looks like #select would be a great method to use.
    Yes, using #select gives us the information that we need. However, what if we only want the names of the owners and not another nested hash. Let’s keep looking through the documentation to see what else we find. The #collect method sounds very useful for this situation. Let’s collect the names if the year is 2020 or newer.
    Using #collect gets us a lot closer to only having the names of the new vehicle owners. If you look at this method in the documentation you will see that #collect and #map have the same functionality. Both of these methods use the return value of each iteration, so when the if statement is false, it will return a nil value.

    Nil values can cause problems down the road, so let’s look through the documentation to see if we can find a method to help solve this problem. The #compact method returns an array (or hash) without nil values, so let’s chain it on the end of the block.
    Yes, using #collect and #compact returns the data that we want. As you can see, chaining methods can be very useful. However, if we continue exploring the documentation, we will find another method that combines the functionality of these two methods. Ruby version 2.7 added a new enumerable method called #filter_map that sounds very useful for this situation.
    Amazing! We have found a great solution to returning an array that only contains the names of the owners of vehicles from 2020 or newer! Plus, we got experience using other methods that you will probably use in the future. I have found some really useful methods by exploring the documentation when I have a specific use case in mind.
