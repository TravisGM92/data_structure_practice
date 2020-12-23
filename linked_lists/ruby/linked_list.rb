class LinkedList
  attr_reader :count, :head

  def initialize
    @count = 0
    @head = nil
  end

  def push(data)
    if @head.nil?
      @head = Node.new(data)
    else
      node = find_tail(@head)
      node.next_node = Node.new(data)
    end
    @count += 1
  end

  def find_tail(node=@head)
    if node.next_node != nil
      return find_tail(node.next_node)
    end
    node
  end

  def pop
    if @count > 1
      last = find_tail(@head)
      current_node = @head
      until current_node.next_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = nil
      @count -= 1
      return last.data
    elsif @count == 1
      last = find_tail(@head)
      @head = nil
      @count -= 1
      return last.data
    else
      return nil
    end
  end

  def delete(data)
    if @head.data == data
      @head = @head.next_node
      @count -= 1
    else
      current_node = @head
      until current_node.next_node.data == data
        break if current_node.next_node.nil?
        current_node = current_node.next_node
      end
      if current_node.next_node.next_node.nil?
        current_node.next_node = nil
        @count -= 1
      else
        current_node.next_node = current_node.next_node.next_node
        @count -= 1
      end
    end
  end

  def to_a
    return [] if @head.nil?
    array = []
    current_node = @head
    until current_node.next_node.nil?
      array << current_node.data
      current_node = current_node.next_node
    end
    array << current_node.data
    array
  end

  def last_node
    find_tail
  end

  def head_node
    @head
  end

  def include?(data)
    current_node = @head
    until current_node.data == data
      break if current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node.data == data
  end

  def find(data)
    current_node = @head
    until current_node.data == data
      break if current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

  def insert(index, data)
    current_head = @head
    if index == 1
      next_section = @head.next_node
      @head.next_node = Node.new(data)
      @head.next_node.next_node = next_section
    else
      index.times{ current_head = current_head.next_node }
    end
  end

  def index(data)
    current_node = @head
    index = 0
    until current_node.data == data
      current_node = current_node.next_node
      index += 1
    end
    index
  end

  def insert_after(first, next_one)
    current_node = @head
    until current_node.data == first
      current_node = current_node.next_node
    end
    next_section = current_node.next_node
    current_node.next_node = Node.new(next_one)
    current_node.next_node.next_node = next_section
  end

  def distance(first, second)
    distance = 0
    first_node = @head
    until first_node.data == first
      first_node = first_node.next_node
    end
    second_node = first_node
    until second_node.data == second
      distance += 1
      second_node = second_node.next_node
    end
    distance
  end
end
