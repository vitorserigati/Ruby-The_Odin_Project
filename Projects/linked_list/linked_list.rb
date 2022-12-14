require_relative './node'

# Linked List Class
class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      val = @head
      val = val.next_node until val.next_node.nil?
      val.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      val = @head
      @head = Node.new(value, val)
    end
  end

  def size
    return 0 if @head.nil?

    count = 1
    val = @head
    until val.next_node.nil?
      count += 1
      val = val.next_node
    end
    count
  end

  def head
    return nil if @head.nil?

    @head.value
  end

  def tail
    return nil if @head.nil?
    return @head if @head.next_node.nil?

    val = @head
    val = val.next_node until val.next_node.nil?
    val.value
  end

  def at(index)
    return nil if @head.nil?

    count = 0
    val = @head
    until count == index || val.next_node.nil?
      count += 1
      val = val.next_node
    end
    val.value
  end

  def pop
    return if @head.nil?

    val = @head
    val = val.next_node until val.next_node.next_node.nil?
    last = val.next_node.value
    val.next_node = nil
    last
  end

  def contains?(value)
    result = false
    val = @head
    until val.next_node.nil? || result == true
      if val.value == value || val.next_node.value == value
        result = true
      else
        val = val.next_node
      end
    end
    result
  end

  def find(value)
    return nil if @head.nil?
    return 0 if @head.value == value

    count = 0
    val = @head
    until val.next_node.nil? || val.value == value
      val = val.next_node
      count += 1
    end
    val.value == value ? count : nil
  end

  def to_s
    string = "(#{@head.value}) -> "
    val = @head
    until val.next_node.nil?
      string << "(#{val.next_node.value}) -> "
      val = val.next_node
    end
    string << '(nil)'
  end
end
