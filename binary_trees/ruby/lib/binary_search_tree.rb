class BinarySearchTree
  attr_reader :root_node, :count

  def initialize root_node=nil
    @root_node = root_node
    @count = 0
  end

  def push(data)
    if @root_node.nil?
      @root_node = Node.new(data)
      @count += 1
    else
      insert_node(find_next(@root_node, data), data)
      @count += 1
    end
  end

  def include?(current=@root_node, data)
    if current.nil?
      false
    else
      find_next(current, data).data == data
    end
  end

  def to_array
    if @root_node.nil?
      []
    else
      all_left_nodes + all_right_nodes
    end
  end

  def sort
    if @root_node.nil?
      []
    else
      to_array.sort
    end
  end

  def min(current=@root_node)
    current.nil? ? current : (current.left.nil? ? current.data : min(current.left))
  end

  def max(current=@root_node)
    current.nil? ? current : (current.right.nil? ? current.data : max(current.right))
  end

  def post_ordered(node=@root_node, result=[])
    return [] if node.nil?
    in_order(node.left, result)
    in_order(node.right, result)
    result << @root_node.data
  end

  def in_order(node=@root_node, result=[])
    return [] if node.nil?
    in_order(node.left, result)
    in_order(node.right, result)
    result << node.data
  end

  def min_height
    @count
  end

  private

  def find_previous(data, current=@root_node)
    if current.left.data == data
      current
    else
      find_previous(data, current.left)
    end
  end

  def find_next(current, new)
    if new <= current.data
      find_next_left(current, new)
    else
      find_next_right(current, new)
    end
  end

  def find_next_left(current, new)
    current.left.nil? ? current : find_next(current.left, new)
  end

  def find_next_right(current, new)
    current.right.nil? ? current : find_next(current.right, new)
  end

  def insert_node(node, new_node_data)
    new_node_data <= node.data ? node.left = Node.new(new_node_data) : node.right = Node.new(new_node_data)
  end

  def all_left_nodes(current=@root_node, array=[])
    array << current.data
    if current.left.nil?
      array
    else
      all_left_nodes(current.left, array)
    end
  end

  def all_right_nodes(current=@root_node.right, array=[])
    array << current.data
    if current.right.nil?
      array
    else
      all_right_nodes(current.right, array)
    end
  end
end
