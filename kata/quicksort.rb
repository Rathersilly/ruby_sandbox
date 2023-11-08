# frozen_string_literal: true

# quicksort
# first created as draft_quicksort.rb
# that implementation worked but was long and did not sort in place

require 'colorize'

def display(array, pivot)
  # a_str = array.to_s.gsub(/[\[\]]|,/,'')
  a_str = array.to_s.gsub(/#{pivot}/, pivot.to_s.yellow.to_s)
  puts a_str
end

def partition(a, low = 0, high = (a.size - 1))
  sleep 0.2
  puts 'ENTERING PARTITION'.yellow
  puts "a = #{a}, low = #{low}, high = #{high}"
  p high
  pivot = a[high]
  p pivot
  # compare each item to pivot and move it
  i = low
  puts "i = #{i}"
  (low..high).each do |j|
    puts j
    # n is the element being tested
    n = a[j]
    print 'testing: ' + n.to_s.green + ' '
    display(a, pivot)

    # [1,2,5,4,3]
    p a[i]
    p a[j]
    if n < pivot
      # 3 needs to be at index 2, so i needs to be 2
      i += 1 # increment latest smallest element
      puts "swapping i = #{i} j = #{j}"
      a[i], a[j] = a[j], a[i] # or else swap
    end
    p a
    # at the end of it, swap pivot and ith element
    a[i], a[high] = a[high], a[i] # or else swap
  end
  3
end

def qs(a, low = 0, high = a.size - 1)
  puts 'ENTERING ALGORITHM'.red

  # return if theres nothing to sort
  if a.size <= 1
    puts "RETURNING #{a}"
    return a
  end
  # pi = pivot index
  # partition function will put a[pi] in sorted position
  pi = partition(a, low, high)
  display(a, pi)

  # ok now have semi-sorted array
  # now to sort the sides
  qs(a, low, (pi - 1))
  qs(a, pi + 1, high)

  # don't need to return array really, since sorted in place
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
