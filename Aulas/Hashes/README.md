## Creating a Hash

    The most basic way to create a hash is to use the hash literal, the curly braces ({}).
    Keys and values are associated with the special operator, called hash rocket: (=>). You can also create a new hash with the #new method. (Hash.new).

## Accessing Values.

    You can access values in a hash the same way that you access elements in an array. When you call a hash’s value by key, the key goes inside a pair of brackets, just like when you’re calling an array by index. ex.( my_hash = {"key" => "value"}; my_hash["key"] #=> "value")
    If you try to access a key that doesn’t exist in the hash, it will return nil.
    However, hashes have a #fetch method that will raise an error when trying to access a key that doesn't exists. This method can return a default value instead of raising an error if the given key is not found. Just pass the default value as second argument to it. ex.( my_hash.fetch("key", "default") )

## Adding and Changing Data

    You can add a key-value pair to a hash by calling the key and setting the value, just like you would with any other variable.
    You can also use this approach to change the value of an existing key.

## Removing Data

    Deleting data from a hash is simple with the hash’s #delete method, which provides the functionality of returning the value of the key-value pair that was deleted from the hash.

## Methods

    Methods from hashes are pretty much the same for arrays, since they both employ the Ruby's Enumerable module.
    A couple of useful methods that are specific to hashes are the #keys and #values methods, which very unsurprisingly return the keys and values of a hash, respectively. Note that both of these methods return arrays.

## Merging Two Hashes

    merge method #=> hash1 = { "a" => 100, "b" => 200 }
                    hash2 = { "b" => 254, "c" => 300 }
                    hash1.merge(hash2)      #=> { "a" => 100, "b" => 254, "c" => 300 }

    Notice that the values from the hash getting merged in (in this case, the values in hash2) overwrite the values of the hash getting merged at (hash1 here) when the two hashes have a key that’s the same.

## Symbols as Hash Keys

    You’ll almost always see symbols (like :this_guy) used as keys. This is predominantly because symbols are far more performant than strings in Ruby, but they also allow for a much cleaner syntax when defining hashes.
