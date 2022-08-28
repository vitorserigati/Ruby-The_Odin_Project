fruits = ['apple', 'banana', 'strawberry', 'pineapple']

puts fruits.none? {| fruit | fruit.length > 10 }

puts fruits.none? {| fruit | fruit.length > 6 }
