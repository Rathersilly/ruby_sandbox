class Array
  def my_cycle(n = nil)
    return nil if size.zero?

    i = 0
    loop do
      break if n < 1
      yield self[i]
      i += 1
      if i == size
        i = 0
        n -= 1 if n
      end
    end
  end
end
a = [1, 2, 3, 4]

a.my_cycle(2) do |x|
  print x
end
puts
a.my_cycle(6) do |x|
  print x
end
a = []
a.my_cycle(6) do |x|
  print x
end
puts
a = [1, 2, 3, 4]
a.my_cycle(-1) do |x|
  print x
end
