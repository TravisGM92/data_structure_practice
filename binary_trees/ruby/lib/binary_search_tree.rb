require_relative 'node'

class BinarySearchTree
  attr_reader :root_node, :count

  def initialize root_node=nil
    @root_node = root_node
    @count = 0
    @all_values = []
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
      if !current.left.nil?
        find_next(value, current.left)
      else
        return current
      end
    else
      if !current.right.nil?
        find_next(value, current.right)
      else
        return current
      end
    end
  end

  def include?(value)
    return false if @root_node.nil?
    next_node = find_next(value)
    if next_node == @root_node && @root_node.data != value
      return false
    elsif (next_node.left.nil? || next_node.right.nil?) && @root_node != next_node
      if (value < next_node.data && next_node.left.nil?) || (value > next_node.data && next_node.right.nil?)
        return false
      else
        return true
      end
    elsif value < next_node.data
      next_node.left.data == value
    elsif value > next_node.data
      next_node.right.data == value
    else
      next_node.data == value
    end
  end

  def to_array
    return @all_values if @root_node.nil?
    get_all_left_values
    get_all_right_values
    @all_values
  end

  def get_all_left_values(current_node=@root_node)
    if !current_node.left.nil?
      @all_values << current_node.data
      get_all_left_values(current_node.left)
    else
      @all_values << current_node.data
    end
  end

  def get_all_right_values(current_node=@root_node.right)
    if !current_node.right.nil?
      @all_values << current_node.data
      get_all_right_values(current_node.right)
    else
      @all_values << current_node.data
    end
  end

  def sort
    return @all_values if @root_node.nil?
    get_all_left_values
    @all_values = @all_values.reverse
    get_all_right_values
    @all_values
  end

  def min
    return @root_node if @root_node.nil?
    get_all_left_values[-1]
  end

  def max
    return @root_node if @root_node.nil?
    get_all_right_values[-1]
  end
end
