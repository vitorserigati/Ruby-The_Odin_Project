## Include? Method

    We can use the #include? Method to know if a element exists or not in an array or hash. It will return true or false.

## Any? Method

    The #any? method returns true if any elements in your array or hash match the condition within the block; otherwise, it will return false.

## All? Method

    It only returns true if all the elements in your array or hash match the condition you set within the block; otherwise, it will return false.
    Special note to keep in mind while debugging: #all? will return true by default unless the block returns false or nil. So if you call #all? on an empty array or hash (i.e., there are no elements for the block to evaluate), it will return true

## None? Method

    #none? performs the opposite function of #all?. It returns true only if the condition in the block matches none of the elements in your array or hash; otherwise, it returns false.
