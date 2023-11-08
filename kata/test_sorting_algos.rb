require './test_begin.rb'

# find name of sorting algorithm
# in sort file define algo_name 
class SortTest < Test
  attr_accessor :algo_name
  def test_sorts_reversed_array
    array = (1..10).to_a.reverse
    assert_equal(send(algo_name, array), (1..10).to_a)
  end

  def test_sorts_even_length_array
    1.times do
      array = (1..10).to_a.shuffle
      assert_equal(send(algo_name, array), (1..10).to_a)
    end
  end

  def test_sorts_odd_length_array
    array = (1..13).to_a.shuffle
    assert_equal(send(algo_name, array), (1..13).to_a)
  end

  def test_sorts_empty_array
    array = []
    assert_equal(send(algo_name, array), array)
  end
  
  def test_sorts_single_element
    array = [5]
    assert_equal(send(algo_name, array), array)
  end


end
