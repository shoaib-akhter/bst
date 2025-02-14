# test_delete.rb
require_relative 'lib/tree'

# Create initial BST
tree = Tree.new([10, 20, 30, 40, 50])

puts "Before deletion:"
def pretty_print(node, prefix = '', is_left = true)
  return if node.nil?

  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
end

pretty_print(tree.root)

# Delete values
tree.delete(30) # Node with two children
tree.delete(10) # Leaf node
tree.delete(50) # Node with one child

puts "\nAfter deletion:"
pretty_print(tree.root)
