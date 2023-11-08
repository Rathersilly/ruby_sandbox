require 'minitest/autorun'
require './a'

class TestMerge < Minitest::Test
  def test_merge
    assert_equal [1, 2, 3, 4], merge([1, 2], [3, 4])
  end

  def test_merge_sort
    assert_equal [1], merge_sort([1])
    assert_equal [], merge_sort([])
    assert_equal [1, 4, 5], merge_sort([5, 4, 1])
  end
end

describe self do
  it 'should sort shuffled array' do
    a = merge_sort((1..10).to_a.shuffle)
    # These lines are the same
    # expect(a).must_equal (1..10).to_a
    _(a).must_equal (1..10).to_a
  end
end
