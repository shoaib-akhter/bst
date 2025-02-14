# lib/tree.rb
require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(array)
    sorted_array = array.uniq.sort  # Remove duplicates and sort
    @root = build_tree(sorted_array)
  end

  def insert(value, node = @root)
    return @root = Node.new(value) if node.nil?  # If tree is empty, set root

    if value < node.data
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    elsif value > node.data
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
    # If value already exists, we do nothing (avoiding duplicates)
  end

  private

  def build_tree(array)
    return nil if array.empty?  # Base case: Stop when the array is empty
    return Node.new(array[0]) if array.length == 1  # Base case: Create a node if one element left

    mid = array.length / 2
    root = Node.new(array[mid])

    root.left = build_tree(array[0...mid])   # Left half
    root.right = build_tree(array[mid+1..])  # Right half

    root
  end
end