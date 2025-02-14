# test_insert.rb
require_relative 'lib/tree'

# Create initial BST
tree = Tree.new([10, 20, 30, 40, 50])

puts "Before insertion:"
def pretty_print(node, prefix = '', is_left = true)
  return if node.nil?

  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
end

pretty_print(tree.root)

# Insert new values
tree.insert(25)
tree.insert(5)
tree.insert(35)

puts "\nAfter insertion:"
pretty_print(tree.root)
