# test_height_depth.rb
require_relative 'lib/tree'

# Create BST
tree = Tree.new([10, 20, 30, 40, 50])

puts "Tree structure:"
def pretty_print(node, prefix = '', is_left = true)
  return if node.nil?

  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
end

pretty_print(tree.root)

# Test height
puts "\nHeight of root (30): #{tree.height(tree.root)}" # Expected: 2
puts "Height of node 20: #{tree.height(tree.find(20))}" # Expected: 1
puts "Height of node 10: #{tree.height(tree.find(10))}" # Expected: 0

# Test depth
puts "\nDepth of root (30): #{tree.depth(tree.root)}" # Expected: 0
puts "Depth of node 20: #{tree.depth(tree.find(20))}" # Expected: 1
puts "Depth of node 10: #{tree.depth(tree.find(10))}" # Expected: 2
