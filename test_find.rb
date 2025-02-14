# test_find.rb
require_relative 'lib/tree'

# Create initial BST
tree = Tree.new([10, 20, 30, 40, 50])

puts "Tree structure:"
def pretty_print(node, prefix = '', is_left = true)
  return if node.nil?

  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
end

pretty_print(tree.root)

# Test find method
puts "\nFinding 30: #{tree.find(30)&.data}"  # Expected output: 30
puts "Finding 10: #{tree.find(10)&.data}"  # Expected output: 10
puts "Finding 50: #{tree.find(50)&.data}"  # Expected output: 50
puts "Finding 100 (not in tree): #{tree.find(100)&.data}"  # Expected output: nil
