# frozen_string_literal: true

# main.rb
require_relative 'lib/tree'

# Helper function to visualize the tree
# rubocop:disable Style/OptionalBooleanParameter
def pretty_print(node, prefix = '', is_left = true)
  # rubocop:enable Style/OptionalBooleanParameter
  return if node.nil?

  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
end

# Step 1: Create a binary search tree with random numbers
random_numbers = Array.new(15) { rand(1..100) }
tree = Tree.new(random_numbers)

puts "\n🎄 Initial Balanced BST:"
pretty_print(tree.root)
puts "\nBalanced? #{tree.balanced?}"

# Step 2: Print level-order, inorder, preorder, and postorder traversals
puts "\n📊 Level-order Traversal:"
p tree.level_order

puts "\n📊 Inorder Traversal (Sorted Order):"
p tree.inorder

puts "\n📊 Preorder Traversal:"
p tree.preorder

puts "\n📊 Postorder Traversal:"
p tree.postorder

# Step 3: Unbalance the tree by inserting high values
tree.insert(120)
tree.insert(150)
tree.insert(180)

puts "\n⚠️ Tree After Insertions (Unbalancing):"
pretty_print(tree.root)
puts "\nBalanced? #{tree.balanced?}"

# Step 4: Rebalance the tree
tree.rebalance

puts "\n✅ Tree After Rebalancing:"
pretty_print(tree.root)
puts "\nBalanced? #{tree.balanced?}"

# Step 5: Print traversals again after rebalancing
puts "\n📊 Level-order After Rebalancing:"
p tree.level_order

puts "\n📊 Inorder Traversal After Rebalancing:"
p tree.inorder

puts "\n📊 Preorder Traversal After Rebalancing:"
p tree.preorder

puts "\n📊 Postorder Traversal After Rebalancing:"
p tree.postorder

puts "\n🎯 All tests completed!"
