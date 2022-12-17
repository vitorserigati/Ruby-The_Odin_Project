# frozen_string_literal: true

require_relative 'node'

# Tree class
class Tree
  attr_reader :root

  def initialize(array)
    new_array = clean_array(array)
    start = 0
    final = new_array.size - 1
    @root = build_tree(new_array, start, final)
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil?
    return root if root.eql? value

    if root.data > value
      root.left = insert(value, root.left)
    elsif root.data < value
      root.right = insert(value, root.right)
    end
    root
  end

  def delete(value, root = @root)
    return root if root.nil?

    if root > value
      root.left = delete(value, root.left)
    elsif root < value
      root.right = delete(value, root.right)
    elsif root.left.nil? && root.right.nil?
      return nil
    elsif root.right.nil?
      return root.left
    elsif root.left.nil?
      return root.right
    else
      root.data = min_value(root.right)
      root.right = delete(root.data, root.right)
    end
    root
  end

  def find(value, root = @root)
    return root if root.data.eql?(value)

    result = nil
    result = find(value, root.left) if root > value && !root.right.nil?
    result = find(value, root.right) if root < value && !root.right.nil?
    result
  end

  def level_order(node = @root, queue = [], new_list = [], &block)
    return if node.nil?

    block.call(node) if block_given?
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    new_list << node.data unless block_given?
    return new_list if queue.empty?

    next_node = queue.shift
    level_order(next_node, queue, new_list, &block)
  end

  def preorder(node = @root, array = [], &block)
    return if node.nil?

    block.call(node) if block_given?
    array << node.data unless block_given?
    preorder(node.left, array, &block)
    preorder(node.right, array, &block)
    return array unless block_given?
  end

  def inorder(node = @root, array = [], &block)
    return if node.nil?

    inorder(node.left, array, &block)
    block.call(node) if block_given?
    array << node.data unless block_given?
    inorder(node.right, array, &block)
    return array unless block_given?
  end

  def postorder(node = @root, array = [], &block)
    return if node.nil?

    postorder(node.left, array, &block)
    postorder(node.right, array, &block)
    block.call(node) if block_given?
    array << node.data unless block_given?
    return array unless block_given?
  end

  def height(node = @root)
    return - 1 if node.nil?

    [height(node.left), height(node.right)].max + 1
  end

  def depth(node = @root, root = @root, deep = 0)
    return height if @root.eql? node
    return if node.nil?

    if root > node
      depth(node, root.left, deep + 1)
    elsif root < node
      depth(node, root.right, deep + 1)
    else
      deep
    end
  end

  def balanced?
    balance, _height = helper_balanced?
    balance
  end

  def rebalance
    new_array = clean_array(inorder)
    final = new_array.size - 1
    @root = build_tree(new_array, 0, final)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def helper_balanced?(node = @root)
    return [true, - 1] if node.nil?

    balance_left, left_height = helper_balanced?(node.left)
    return [false, left_height] unless balance_left

    _balance_right, right_height = helper_balanced?(node.right)
    balance = (left_height - right_height).abs <= 1
    height = [left_height, right_height].max + 1
    balance ? [true, height] : [false, height]
  end

  def build_tree(array, start, final)
    return nil if start > final

    mid = (start + final) / 2
    root = Node.new(array[mid])
    root.left = build_tree(array, start, mid - 1)
    root.right = build_tree(array, mid + 1, final)
    root
  end

  def clean_array(array)
    new_array = array
    new_array.sort.uniq
  end

  def min_value(root)
    min_v = root.data
    until root.left.nil?
      min_v = root.left.data
      root = root.left
    end
    min_v
  end
end
