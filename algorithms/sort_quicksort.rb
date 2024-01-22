# Quicksort
# choose a value to be pivot
# create array of smaller values and array of larger values
# do this again recursively
# concatenate the sorted arrays
require 'colorize'
require_relative 'sort_debug_helpers'

def quicksort(array)
  return array if array.size <= 1

  memo = array.dup

  left = []
  right = []
  (1..memo.size - 1).each do |i|
    if memo[i] <= memo[0]
      left << memo[i]
    else
      right << memo[i]
    end
  end
  # print_locals(binding)
  quicksort(left) + [memo[0]] + quicksort(right)
end

def sort(a)
  quicksort a
end

arr = (1..5).to_a.shuffle
arr = (1..10).to_a.reverse
arr = (1..10).to_a.shuffle
# print_locals(binding)
p arr
p sort(arr)
# arr = Array.new(100) { rand(100) }
# p arr
arr = (1..5).to_a.shuffle
arr = Array.new(5) { Array.new(5) { (1..5).to_a } }
# p arr
# p arr.sort
puts
p arr
arrdup = arr.dup
puts
str = Marshal.dump arr
p str
p arrdup
arrdup.each do |x|
  x.each do |y|
    y.map! { 3 }
  end
end
p arrdup
puts
p arr
foo = Marshal.load str
p foo
