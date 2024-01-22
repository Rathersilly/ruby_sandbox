# Example usage: ruby test_sort_generic.rb sort_merge.rb
# sort_merge.rb must have a method named sort(array)

require 'colorize'
require 'minitest/autorun'

if !ARGV.empty?
  puts "requiring #{ARGV[0]}"
  # require_relative 'sort_selection'
  require_relative ARGV[0].to_s
else
  puts 'usage: ruby test_sort_generic foo.rb'
  exit
end

class TestSort < Minitest::Test
  def setup
    # array_size = 100
    # arr = Array.new(100) { rand(100) }
    # p arr
  end

  def test_sorts_reversed_array
    arr = (1..100).to_a.reverse
    assert_equal(sort(arr), arr.sort)
  end

  def test_sorts_sorted_array
    arr = (1..100).to_a
    assert_equal(sort(arr), arr.sort)
  end

  def test_sorts_random_array
    arr = Array.new(100) { rand(100) }
    assert_equal(sort(arr), arr.sort)
  end

  def test_sorts_shuffled_array
    arr = (1..100).to_a.shuffle
  end

  def test_sorts_empty_array
    arr = []
    sorted = sort(arr)
    assert_equal(sort(arr), arr.sort)
  end

  def test_sorts_words
    str = "OMG hello there I'm your biggest fan in the world!"
    arr = str.split

    assert_equal(sort(arr), arr.sort)
  end
end
