# frozen_string_literal: true

# this implementation sorts but is too long and doesnt sort in place
# quicksort
# choose an element of array as pivot
# change array into 2 halves, based on whether or not the are >< the pivot
require 'colorize'

def display(array, pivot)
  # a_str = array.to_s.gsub(/[\[\]]|,/,'')
  a_str = array.to_s.gsub(/#{pivot}/, pivot.to_s.yellow.to_s)
  puts a_str
end

def qs(a)
  puts 'ENTERING ALGORITHM'.red
  # return if theres nothing to sort
  if a.size <= 1
    puts "RETURNING #{a}"
    return a
  end
  # choose index of pivot
  pivot = a[-1]
  display(a, pivot)
  i = 0
  pivot_index = a.size - 1
  # puts "pivot index: #{pivot_index}"
  a.size.times do
    n = a[i]
    print 'testing: ' + n.to_s.green + ' '
    display(a, pivot)
    if n > pivot
      a.push(n)
      a.delete_at(i)
      pivot_index -= 1
      # puts "pivot index: #{pivot_index}"
      next
    end
    i += 1
  end
  # ok now have semi-sorted array
  # now to sort the sides

  right = a[(pivot_index + 1)..-1]
  left = a[0..(pivot_index - 1)]
  if pivot_index == 0
    left = []
    # right = a[(pivot_index + 1)..-1]
  end
  if pivot_index == a.size - 1
    right = []
    # left = a[0..(pivot_index-1)]
  end

  puts "left = #{left}, pivot = #{pivot}, right = #{right}"
  a = qs(left) + [pivot] + qs(right)
  puts '***'

  a
end

# array = [1,5,4,2,3]
array = (1..6).to_a.shuffle
p array
p qs(array)
p array

if $PROGRAM_NAME == __FILE__
  # need to rename sort method in a way that this file can read it
  require './test_sorting_algos'
  test = SortTest.new
  test.algo_name = 'qs'
  puts test.algo_name
  test.run

end
