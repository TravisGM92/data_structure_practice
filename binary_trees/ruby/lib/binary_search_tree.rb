require_relative 'node'

class BinarySearchTree
  attr_reader :root_node, :count

  def initialize
    @root_node = nil
    @count = 0
    @all_values = []
  end

  def push(value)
    @root_node.nil? ? @root_node = Node.new(value) : @root_node.push(value)
    @count += 1
  end

  def include?(value)
    @root_node.include?(value)
  end

  def to_array
    all_left_values
    all_right_values
    @all_values
  end

  def sort
    return @all_values if @root_node.nil?
    to_array.sort
  end

  def min
    return @root_node if @root_node.nil?
    all_left_values
    @all_values[-1]
  end

  def max
    return @root_node if @root_node.nil?
    all_right_values
    @all_values[-1]
  end

  private

  def all_left_values(current=@root_node)
    if @root_node.nil?
      @all_values
    elsif !current.nil?
      @all_values << current.data
      all_left_values(current.left)
    end
  end

  def all_right_values(current=@root_node)
    return @all_values if @root_node.nil?
    if !current.right.nil?
      @all_values << current.right.data
      all_right_values(current.right)
    end
  end
end
