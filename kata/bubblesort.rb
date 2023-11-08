# frozen_string_literal: true

# point to the first element in the array
# while it is greater than the next element, swap them
# continue this until the next item is greater#
# then make the pointer point to that item. keep
# comparing until the pointer's index is
# array length -1
#
a = Array.new(10) { |i| i }.shuffle
p a

def bubblesort(array)
  loops = 0
  while loops < array.length
    cur = 0
    while cur < array.length - loops - 1

      print 'loops', loops, 'cur', cur
      p array

      if array[cur] > array[cur + 1]
        array[cur], array[cur + 1] = array[cur + 1], array[cur]
      end
      cur += 1
    end
    loops += 1
  end

  array
end

p a
p bubblesort(a)
