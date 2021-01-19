require_relative 'node'

class BinarySearchTree
  attr_reader :root_node, :count

  def initialize root_node=nil
    @root_node = root_node
    @count = 0
  end

  def push(value)
    if root_node.nil?
      @root_node = Node.new(value)
      @count += 1
    else
      current = find_next(value)
      value <= current.data ? current.left = Node.new(value) : current.right = Node.new(value)
      @count += 1
    end
  end

  def find_next(value, current=@root_node)
    if value <= current.data
      find_next(value, current=current.left) if !current.left.nil?
    else
      find_next(value, current=current.right) if !current.right.nil?
    end
    return current
  end
end
