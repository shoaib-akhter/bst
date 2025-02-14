# frozen_string_literal: true

# lib/tree.rb
require_relative 'node'
require_relative 'tree_traversal'
require_relative 'tree_utils'

# Represents a balanced Binary Search Tree (BST)
class Tree
  include TreeTraversals
  include TreeUtils

  attr_accessor :root

  def initialize(array)
    sorted_array = array.uniq.sort
    @root = build_tree(sorted_array)
  end

  def insert(value, node = @root)
    return @root = Node.new(value) if node.nil?

    value < node.data ? insert_left(node, value) : insert_right(node, value)
  end

  def delete(value)
    @root = delete_node(@root, value)
  end

  def find(value, node = @root)
    return nil if node.nil?
    return node if node.data == value

    value < node.data ? find(value, node.left) : find(value, node.right)
  end

  def balanced?
    balanced_helper(@root)
  end

  def rebalance
    @root = build_tree(inorder)
  end

  private

  def balanced_helper(node)
    return true if node.nil?

    left = height_helper(node.left)
    right = height_helper(node.right)
    return false if (left - right).abs > 1

    balanced_helper(node.left) && balanced_helper(node.right)
  end

  def insert_left(node, value)
    node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
  end

  def insert_right(node, value)
    node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
  end

  def delete_node(node, value)
    return node if node.nil?
    return handle_deletion(node) if node.data == value

    value < node.data ? node.left = delete_node(node.left, value) : node.right = delete_node(node.right, value)
    node
  end

  def handle_deletion(node)
    return nil if node.left.nil? && node.right.nil?
    return node.right if node.left.nil?
    return node.left if node.right.nil?

    replace_with_successor(node)
  end

  def replace_with_successor(node)
    successor = find_min(node.right)
    node.data = successor.data
    node.right = delete_node(node.right, successor.data)
    node
  end

  def yield_or_return(values)
    block_given? ? values.each { |val| yield(Node.new(val)) } : values
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
    root.right = build_tree(array[mid + 1..])
    root
  end
end
