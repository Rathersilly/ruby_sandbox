require 'optparse'
require 'colorize'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: example.rb [options]'

  opts.on('-t', '--test', 'test') do |t|
    require 'minitest/pride'
    require 'minitest/autorun'
    asdf = Minitest::PrideIO.new($stdout)
    class TestBubble < Minitest::Test
      def test_bubble_sort
        assert_equal (1..20).to_a, bubble_sort((1..20).to_a.shuffle)
        assert_equal [1], bubble_sort([1])
        assert_equal [], bubble_sort([])
        assert_equal [1, 4, 5], bubble_sort([5, 4, 1])
      end
    end

    options[:test] = t
  end
end.parse!

puts "cmdline options: #{options}"
puts "ARGV: #{ARGV}"


def bubble_sort_described(array)
  puts "Entering bubble_sort_described(array)".yellow
  max_unsorted_index = array.size - 1
  puts 'set max_unsorted_index to last index of array'.yellow

  puts 'Outer Loop: while max_unsorted_index > 0'.blue
  while max_unsorted_index > 0
    puts "\tset i = 0"
    i = 0

    puts "\tInner Loop: while i < max_unsorted_index".green
    while i < max_unsorted_index
      puts "\ti: #{i}, unsorted_index: #{max_unsorted_index}"
      array[i], array[i + 1] = array[i + 1], array[i] if array[i] > array[i + 1]
      i += 1
      max_unsorted_index -= 1 if i == max_unsorted_index
    end
  end
  array
end

# uses descending max_unsorted_index to stop sorting
def bubble_sort(array)
  max_unsorted_index = array.size - 1

  while max_unsorted_index > 0
    i = 0
    while i < (max_unsorted_index - 1) # and array[i + 1]
      array[i], array[i + 1] = array[i + 1], array[i] if array[i] > array[i + 1]
      i += 1
      max_unsorted_index -= 1 if i == max_unsorted_index
    end
  end
  array
end

# uses unsorted flag to stop sorting
def bubble_sort2(array)
  unsorted = true
  while unsorted
    i = 0
    unsorted = false
    while i < (array.length - 1)
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        unsorted = true
      end
      i += 1
    end
  end
  print array
end

# a = (1..10).to_a.shuffle
a = [2, 5, 3, 1, 4]
puts "Input array: #{a}"
puts "Sorted array: #{bubble_sort_described(a)}"
