# lib/tree.rb
require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(array)
    sorted_array = array.uniq.sort
    @root = build_tree(sorted_array)
  end

  def insert(value, node = @root)
    return @root = Node.new(value) if node.nil?

    if value < node.data
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    elsif value > node.data
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
  end

  def delete(value)
    @root = delete_node(@root, value)
  end

  private

  def delete_node(node, value)
    return node if node.nil?

    if value < node.data
      node.left = delete_node(node.left, value)
    elsif value > node.data
      node.right = delete_node(node.right, value)
    else
      return handle_deletion(node)
    end
    node
  end

  def handle_deletion(node)
    return nil if node.left.nil? && node.right.nil?
    return node.right if node.left.nil?
    return node.left if node.right.nil?

    successor = find_min(node.right)
    node.data = successor.data
    node.right = delete_node(node.right, successor.data)
    node
  end

  def find_min(node)
    node = node.left until node.left.nil?
    node
  end

  def build_tree(array)
    return nil if array.empty?
    return Node.new(array[0]) if array.length == 1

    mid = array.length / 2
    root = Node.new(array[mid])

    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid+1..])

    root
  end
end
