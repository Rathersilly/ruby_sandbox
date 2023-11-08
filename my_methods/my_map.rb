# frozen_string_literal: true

class Array
  def my_map
    c = 0
    acc = []
    puts self
    puts "size = #{size}"
    until c == size
      acc << yield(self[c])
      puts self[c]
      c += 1
    end
    acc
  end
end

array = [1, 2, 3]
p array
p array.my_map { |i| i * 3 }
