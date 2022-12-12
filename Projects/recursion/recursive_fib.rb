# frozen_string_literal: true

def fib(num)
  array = [0, 1]
  i = 0
  until array.length == num
    array << array[i] + array[i + 1]
    i += 1
  end
  array
end

def fib_rec(num)
  num < 2 ? num : fib_rec(num - 1) + fib_rec(num - 2)
end

# puts fib(8)
puts fib_rec(7)
