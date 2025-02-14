# frozen_string_literal: true

# lib/tree_utils.rb

# Module for utility methods in a BST (height, depth, BFS).
module TreeUtils
  def level_order(&block)
    return [] if @root.nil?

    bfs_traverse(&block)
  end

  def height(node)
    height_helper(node)
  end

  def depth(node)
    depth_helper(node, @root, 0)
  end

  private

  def bfs_traverse(&block)
    queue = [@root]
    values = []
    process_bfs(queue, values, &block) until queue.empty?
    values unless block_given?
  end

  def process_bfs(queue, values)
    node = queue.shift
    block_given? ? yield(node) : values << node.data
    enqueue_children(queue, node)
  end

  def enqueue_children(queue, node)
    queue << node.left if node.left
    queue << node.right if node.right
  end

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
end
