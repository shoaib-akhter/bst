# test_dfs.rb
require_relative 'lib/tree'

# Create a balanced BST
tree = Tree.new([10, 20, 30, 40, 50])

puts "Tree structure:"
def pretty_print(node, prefix = '', is_left = true)
  return if node.nil?

  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
end

pretty_print(tree.root)

# Test inorder traversal
puts "\nInorder traversal (array output):"
p tree.inorder  # Expected output: [10, 20, 30, 40, 50]

# Test inorder with block
puts "\nInorder traversal (block output):"
tree.inorder { |node| print "#{node.data} " }
puts

# Test preorder traversal
puts "\nPreorder traversal:"
p tree.preorder  # Expected output: [30, 20, 10, 50, 40]

# Test postorder traversal
puts "\nPostorder traversal:"
p tree.postorder  # Expected output: [10, 20, 40, 50, 30]
