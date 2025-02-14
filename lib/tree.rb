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

  def inorder(&block)
    dfs_inorder(@root, [], &block)
  end

  def preorder(&block)
    dfs_preorder(@root, [], &block)
  end

  def postorder(&block)
    dfs_postorder(@root, [], &block)
  end

  def height(node)
    height_helper(node)
  end
  
  def depth(node)
    depth_helper(node, @root, 0)
  end

  private

  def height_helper(node)
    return -1 if node.nil?
    1 + [height_helper(node.left), height_helper(node.right)].max
  end
  
  def depth_helper(node, current, level)
    return -1 if current.nil?
    return level if current == node
    move = node.data < current.data ? current.left : current.right
    depth_helper(node, move, level + 1)
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

  def dfs_inorder(node, values, &block)
    return values if node.nil?
    dfs_inorder(node.left, values, &block)
    values << node.data
    dfs_inorder(node.right, values, &block)
    yield_or_return(values, &block)
  end

  def dfs_preorder(node, values, &block)
    return values if node.nil?
    values << node.data
    dfs_preorder(node.left, values, &block)
    dfs_preorder(node.right, values, &block)
    yield_or_return(values, &block)
  end

  def dfs_postorder(node, values, &block)
    return values if node.nil?
    dfs_postorder(node.left, values, &block)
    dfs_postorder(node.right, values, &block)
    values << node.data
    yield_or_return(values, &block)
  end

  def yield_or_return(values, &block)
    block_given? ? values.each { |val| yield(Node.new(val)) } : values
  end

  def bfs_traverse
    queue = [@root]
    values = []
    until queue.empty?
      process_bfs(queue, values, &Proc.new)
    end
    values unless block_given?
  end

  def process_bfs(queue, values, &block)
    node = queue.shift
    block_given? ? yield(node) : values << node.data
    enqueue_children(queue, node)
  end

  def enqueue_children(queue, node)
    queue << node.left if node.left
    queue << node.right if node.right
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
