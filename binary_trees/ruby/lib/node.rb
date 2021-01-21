require_relative 'empty_node'

class Node
  attr_reader :data
  attr_accessor :left, :right
  def initialize(data, left=nil, right=nil)
    @data = data
    @left = left
    @right = right
  end

  def push(v)
    if self.data == v
      self.left = Node.new(v)
    else
      case data <=> v
      when 1 then insert_left(v)
      when -1 then insert_right(v)
      when 0 then false
      end
    end
  end

  def include?(v, node=self)
    if node.nil?
      return false
    elsif v < node.data
      include?(v, node.left)
    elsif v > node.data
      include?(v, node.right)
    else
      true
    end
  end

  private

  def insert_left(value)
    if left
      left.push(value)
    else
      self.left = Node.new(value)
    end
  end

  def insert_right(value)
    if right
      right.push(value)
    else
      self.right = Node.new(value)
    end
  end
end
