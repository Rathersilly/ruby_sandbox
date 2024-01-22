# Selection sort selects the highest(or lowest) value and swaps it
# with the first value of the unsorted part(thus creating a sorted part
# of the array
# On^2
require 'colorize'
require_relative 'sort_debug_helpers'

def find_lowest(arr)
  return if arr.empty?

  lowest_index = 0
  arr.each.with_index do |x, i|
    # print_locals(binding)
    lowest_index = i if x < arr[lowest_index]
    # print "lowest: index: #{lowest_index.to_s.yellow} "
    # puts "value: #{arr[lowest_index].to_s.yellow}"
  end
  # print "lowest: index: #{lowest_index.to_s.light_blue} "
  # puts "value: #{arr[lowest_index].to_s.light_blue}"

  lowest_index
end

def selection_sort(arr)
  arr.each.with_index do |_x, i|
    temp = arr[i]
    lowest_index = find_lowest(arr[i..-1]) + i
    # puts "swapping arr[#{i}](#{arr[i]}) and arr[#{lowest_index}](#{arr[lowest_index]})".light_green
    arr[i] = arr[lowest_index]
    arr[lowest_index] = temp
    # print_locals(binding)
  end
  arr
end

def sort(arr)
  selection_sort arr
end

# arr = (1..5).to_a.shuffle
# # print_locals(binding)
# p arr
# p selection_sort(arr)
# arr = Array.new(100) { rand(100) }
# p arr
