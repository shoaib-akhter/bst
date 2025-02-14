# test_level_order.rb
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

# Test level_order without block
puts "\nLevel-order traversal (array output):"
p tree.level_order  # Expected output: [30, 20, 50, 10, 40]

# Test level_order with block
puts "\nLevel-order traversal (block output):"
tree.level_order { |node| print "#{node.data} " }  # Expected output: 30 20 50 10 40
puts
