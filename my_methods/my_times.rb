# frozen_string_literal: true

require_relative 'my_each'
class Integer
  def my_times
    c = 0
    puts "counting to #{self}"
    while c < self
      yield c
      c += 1
    end
    puts self
  end
end

5.my_times { |i| puts i }
[1, 2].hi
