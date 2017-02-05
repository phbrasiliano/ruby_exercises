class LinkedList
  attr_accessor :head, :tail
  attr_reader :size

  def initialize(data = nil)
    @head = Node.new(data)
    @tail = @head
    @size = 1
  end

  def append(data = nil) # adds a new node to the end of the list
      old_tail = @tail
      @tail = Node.new(data)
      if @head.value == nil
        @head = @tail 
        @size -=1
      end
      old_tail.next_node = @tail
      @size += 1

  end

  def prepend(data = nil) #adds a new node to the start of the list
    temp_head = Node.new(data)
    temp_head.next_node = @head
    @head = temp_head
    @size += 1    
  end

  def at(index) #returns the node at a given index
    final_value = @head
    (index).times do
      final_value = final_value.next_node
    end
    raise 'No value at this index.' if final_value == nil
    final_value
  end

  def pop #removes the last element from the list

  end

  def contains?(data) #returns true if the passed in value is in the list.
    current_node = @head
    while current_node
      return true if current_node.value == data
      current_node = current_node.next_node
    end
    return false
  end


  def to_s #represents the linked list as a string
    return 'empty linked list' if @head.value == nil
    current_node = @head
    final_s = ''
    while current_node.next_node
      final_s +=  "( #{current_node.value.to_s} ) -> "
      current_node = current_node.next_node
    end
    final_s += "( #{current_node.value.to_s} )"
    return final_s
  end

end



class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
