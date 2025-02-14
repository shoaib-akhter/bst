# test_balance.rb
require_relative 'lib/tree'

# Create a balanced BST
tree = Tree.new(Array.new(15) { rand(1..100) })

puts "Balanced? #{tree.balanced?}" # Expected: true

# Print level-order before unbalancing
puts "\nLevel-order before unbalancing:"
p tree.level_order

# Unbalance the tree
tree.insert(150)
tree.insert(200)
tree.insert(300)

puts "\nBalanced after insertions? #{tree.balanced?}" # Expected: false

# Rebalance the tree
tree.rebalance

puts "\nBalanced after rebalancing? #{tree.balanced?}" # Expected: true

# Print level-order after rebalancing
puts "\nLevel-order after rebalancing:"
p tree.level_order
