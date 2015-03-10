class TreeNode # class TreeNode
  attr_accessor :value, :left, :right
  def initialize(value, left, right) # initialize with value, left, and right
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTree
  def initialize(value) # initialize with value
    @root = TreeNode.new(value, nil, nil) # root is a new TreeNode with value
  end
  # Pre-order Traversal = root, left, right
  def preOrderTraversal(node = @root) # preOrderTraversal has a parameter of node, which is equal to @root
    return if node == nil
    puts node.value.to_s # First puts the first value
    preOrderTraversal(node.left) # puts left node
    preOrderTraversal(node.right) # puts right node
  end
  # Post-order Traversal = left, right, root
  def postOrderTraversal(node = @root)
    return if node == nil
    postOrderTraversal(node.left)
    postOrderTraversal(node.right)
    puts node.value.to_s
  end
  # In-order Traversal = left, root, right
  def inOrderTraversal(node = @root)
    return if node == nil
    inOrderTraversal(node.left)
    puts node.value.to_s
    inOrderTraversal(node.right)
  end
  # Inserting a value
  # When value > current node, go towards the right
  # when value < current node, go towards the left
  # when you hit a nil node, it means, the new node should be created there
  # Duplicate values are not inserted in the tree
  def insert(value)
    current_node = @root
    while current_node != nil # while there currently is a node
      if value < current_node.value && current_node.left == nil # when there is no node to the left
        current_node.left = TreeNode.new(value, nil, nil) # Create a new node to the left
      elsif value > current_node.value && current_node.right == nil # when there is no node to the right
        current_node.right = TreeNode.new(value, nil, nil) # Create a new node to the right
      elsif value < current_node.value # when the value is smaller than the current node's value and there is a node to the left
        current_node = current_node.left # current node is set to current node's left
      elsif value > current_node.value # when the value is greater than the current node's value and there is a node to the right
        current_node = current_node.right # current node is set to current node's right
      else
        return
      end
    end
  end
  # finding node with the largest value
  def find_largest(node = @root)
    current_node = node # set current node is node (@root)
    while current_node # while there currently is a node
      if current_node.right.nil? # if the current node's right node does not exist
        puts current_node.value # puts current node's value because it is the largest
      end
      current_node = current_node.right # then set the current node as current node's right node.
    end
  end
  # finding node with the second largest value
  def find_second_largest(node = @root)
    current_node = node # set current node is node (@root)
    while current_node # while there currently is a node
      if current_node.left && current_node.right.nil? # if there is a node to the left and no node to the right
        # puts find_largest(current_node.left) this is the same as line 72
        puts current_node.left.value # current node's left node has the second largest value
      end
      if current_node.right && current_node.right.left && current_node.right.right # if the current node has a node to the right and that right node has a node to the left
        puts current_node.right.value # current node's right node has the second largest value
      end
      current_node = current_node.right # then set the current node as current node's right node.
    end
  end

end

bst = BinarySearchTree.new(10)
bst.insert(11)
bst.insert(9)
bst.insert(5)
bst.insert(7)
bst.insert(18)
bst.insert(17)

puts "In-order Traversal"
bst.inOrderTraversal
puts "Pre-order Traversal"
bst.preOrderTraversal
puts "Post-order Traversal"
bst.postOrderTraversal
puts "Largest Value"
bst.find_largest
puts "Second Largest Value"
bst.find_second_largest