require 'minitest/autorun'
require_relative 'sort_insertion'

class TestSort < Minitest::Test
  def test_sorts_reversed_array
    arr = (1..100).to_a.reverse
    sorted = selection_sort(arr)
    assert_equal(sorted, arr.sort)
  end

  def test_sorts_sorted_array
    arr = (1..100).to_a
    sorted = selection_sort(arr)
    assert_equal(sorted, arr.sort)
  end

  def test_sorts_random_array
    arr = Array.new(100) { rand(100) }
    sorted = selection_sort(arr)
    assert_equal(sorted, arr.sort)
  end

  def test_sorts_shuffled_array
    arr = (1..100).to_a.shuffle
    sorted = selection_sort(arr)

    assert_equal(sorted, arr.sort)
  end

  def test_sorts_empty_array
    arr = []
    sorted = selection_sort(arr)
    assert_equal(sorted, arr.sort)
  end

  def test_sorts_words
    str = "OMG hello there I'm your biggest fan in the world!"
    arr = str.split
    sorted = selection_sort(arr)

    assert_equal(sorted, arr.sort)
  end
end
