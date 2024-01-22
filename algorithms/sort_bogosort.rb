# Bogosort
# randomly shuffle array and check if its sorted
# Best case: O(n)
# Average case: O((n+1)!)
# Worst case: unbounded (never guaranteed)
require 'colorize'

@sort_attempts = 0
def check_sorted(array)
  array.each.with_index do |item, i|
    return true if array.size == i + 1
    return false if item > array[i + 1]
  end
end

def bogosort(a)
  loop do
    break if check_sorted(a)

    a.shuffle!

    puts 'Attempting to sort'.blue
    p a
    @sort_attempts += 1
  end
end

a = (1..5).to_a.shuffle
p a
bogosort(a)
puts "Whew done!  Took #{@sort_attempts} attempts!"
