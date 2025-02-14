# test_node.rb
require_relative 'lib/node'  # Correct path to access the Node class

node1 = Node.new(10)
node2 = Node.new(20)

puts node1.data  # Expected output: 10
puts node2.data  # Expected output: 20

puts node1 < node2  # Expected output: true (because 10 < 20)
puts node1 > node2  # Expected output: false
