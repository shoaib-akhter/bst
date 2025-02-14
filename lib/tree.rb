# lib/tree.rb
require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(array)
    sorted_array = array.uniq.sort  # Remove duplicates and sort
    @root = build_tree(sorted_array)
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