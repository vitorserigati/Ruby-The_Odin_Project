module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    until i == self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_count
    if block_given?
      count = 0
      self.my_each { |i| count += 1 if yield(i) }
      count
    else
      self.length
    end
  end

  def my_select
    array = []
    self.my_each { |i| array << i if yield(i) }
    array
  end

  def my_none?
    result = true
    self.my_each { |i| result = false if yield(i) }
    result
  end

  def my_any?
    result = false
    self.my_each { |i| result = true if yield(i) }
    result
  end

  def my_all?
    result = false
    array = []
    self.my_each { |i| array << self[i] if yield(i) }
    result = true if array.length == self.length
    result
  end

  def my_map
    array = []
    self.my_each { |i| array << yield(i) }
    array
  end

  def my_inject(var = 0)
    result = var
    self.my_each { |i| result = yield(result, i) }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      i = 0
      until i == self.length
        yield(self[i])
        i += 1
      end
    end
    self
  end
end
