# frozen_string_literal: true

# lib/tree_traversals.rb

# Module for depth-first search (DFS) traversals in a BST.
module TreeTraversals
  def inorder(&block)
    dfs_inorder(@root, [], &block)
  end

  def preorder(&block)
    dfs_preorder(@root, [], &block)
  end

  def postorder(&block)
    dfs_postorder(@root, [], &block)
  end

  private

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
end
