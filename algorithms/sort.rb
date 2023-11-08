# frozen_string_literal: true

a = (1..5).to_a.shuffle
p a

n = 0
def check_sorted(array)
  array.each.with_index do |item, i|
    return true if array.size == i + 1
    return false if item > array[i + 1]
  end
end

loop do
  a.shuffle!

  break if check_sorted(a)

  p a
  n += 1
end

p a
puts "Whew done!  Took #{n} attempts!"
