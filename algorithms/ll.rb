class LinkedList
  # push pop shift unshift
  class Node
    # next prev start end etc
    attr_accessor :next, :prev, :value

    def initialize(value)
      @value = value
    end
  end

  def initialize
    @head = nil
    @tail = nil
  end

  def push(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      node.prev = @tail
      @tail = node
    end
  end

  def pop
    value = @tail.value
    @tail = @tail.prev
    @tail.next = nil
    value
  end

  def shift(value)
    node = Node.new(value)
    node.next = @head
    @head = node
  end

  def print
    cur = @head
    while cur
      Kernel.print "#{cur.value} "
      cur = cur.next
    end
    puts
  end

  def size
    return 0 unless @head

    n = 1
    cur = @head
    while cur.next
      n += 1
      cur = cur.next
    end
    n
  end
end

list = LinkedList.new
10.times do |i|
  list.push i**2
end

list.print
p list.pop
list.pop
list.print

3.times do |i|
  list.shift i * 7
end
list.print

p list.size
3.times do |i|
  list.shift i * 7
end
p list.size
