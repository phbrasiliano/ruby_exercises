class LinkedList
  attr_accessor :head, :tail
  attr_reader :size

  def initialize(data = nil)
    @head = Node.new(data)
    @tail = @head
    @size = 1
  end

  def append(data = nil)
    old_tail = @tail
    @tail = Node.new(data)
    @head = @tail if @head.value == nil
    @size += 1
    old_tail.next_node = @tail
  end

  def prepend(data = nil)
    old_head = @head
    @size += 1
    @head = Node.new(data, old_head)
  end

  def at(index)
    return @tail if index >= @size
    node = @head
    index.times do
      node = node.next_node
    end
    return node
  end

  def pop
    old_tail = @tail
    @size -= 1
    @tail = self.at(@size - 1)
    @tail.next_node = nil
    return old_tail.value
  end

  def contains?(data)
    node = @head
    loop do
      return true if node.value == data
      break unless node.next_node
      node = node.next_node
    end
    return false
  end

  def find(data)
    node = @head
    index = 0
    loop do
      return index if node.value == data
      break unless node.next_node
      node = node.next_node
      index += 1
    end
    return nil
  end

  def insert_at(index, data)
    if index > @size - 1
      self.append(data) 
    elsif index == 0
      self.prepend(data)
    else
      node = @head
      prev = node
      index.times do |i|
        prev = node 
        node = node.next_node
      end
    
      new = Node.new(data, node)
      prev.next_node = new
      @size += 1
    end
  end

  def remove_at(index)
    if index > @size - 1
      return nil 
    elsif index == @size - 1
      return self.pop
    elsif index == 0
      old_head = @head
      @head = old_head.next_node
      @size -= 1
      return old_head.value
    else
      node = @head
      prev = node
      index.times do |i|
        prev = node 
        node = node.next_node
      end
    
      prev.next_node = node.next_node 
      @size -= 1
      return node.value
    end
  end

  def to_s
    string = ""
    node = @head
    loop do
      string << "( #{node.value} ) -> "
      break unless node.next_node
      node = node.next_node
    end
    string << "nil"
    return string
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end




linked_list = LinkedList.new

puts linked_list.to_s
linked_list.append(12)
linked_list.append(13)
linked_list.append(14)
puts linked_list.to_s
linked_list.prepend(11)
linked_list.prepend(10)
puts linked_list.to_s