fruits = ['apple', 'banana', 'strawberry', 'pineapple']

puts fruits.all? {| fruit | fruit.length > 3}

puts fruits.all? {| fruit | fruit.length > 6}