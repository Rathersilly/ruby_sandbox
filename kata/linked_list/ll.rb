# frozen_string_literal: true

require 'pry'
class Node
  attr_accessor :value, :next
  def initialize(value = nil)
    @value = value
  end
end

class LL
  attr_accessor :head, :tail
  def initialize
    # @head = Node.new
    # @tail = @head
    @size = 0
  end

  def append(value)
    # create new node with value value and point last to it
    n = Node.new(value)
    # binding.pry
    if @size == 0
      @head = n
      @tail = n
    else @tail.next = n
         @tail = n
    end
    @size += 1
  end

  def prepend(value)
    n = Node.new(value)
    n.next = @head
    @head = n
    @size += 1
  end

  def pop
    return nil if @size == 0

    if @size == 1
      tail = @tail.value
      @head = nil
      @tail = nil
      return tail
    end

    cur = @head
    tail = @tail
    cur = cur.next until cur.next == @tail
    @tail = cur
    @tail.next = nil
    @size -= 1
    tail.value
  end

  def show
    cur = @head
    print "List (#{self}): "
    while cur
      if cur.next
        print cur.value, ' -> '
      else
        puts cur.value
      end
      cur = cur.next
    end
  end
end

list = LL.new
10.times do |i|
  list.append(i)
end
list.show

4.times do
  puts "Popping: #{list.pop}"
  print 'List is now: '
  list.show
end
