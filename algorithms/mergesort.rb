require 'minitest/autorun'

def merge(a, b)
  memo = []
  until (a == []) && (b == [])
    if a == []
      memo << b.shift
    elsif b == []
      memo << a.shift
    elsif a[0] < b[0]
      memo << a.shift
    elsif b[0] < a[0]
      memo << b.shift
    end
  end
  memo
end

def ms(a)
  return a if a.size <= 1

  merge(ms(a[0..a.size / 2 - 1]), ms(a[a.size / 2..-1]))
end

# class TestMergeSort < Minitest::Test
describe self do
  before do
    @a = (1..10).to_a.shuffle
  end

  describe 'merge' do
    it 'should merge sorted arrays' do
      a = [1, 4, 6]
      b = [2, 3, 9]
      _(merge(a, b)).must_equal [1, 2, 3, 4, 6, 9]
    end
    it 'should merge empty and other' do
      _(merge([], [2, 3])).must_equal [2, 3]
    end
  end
  describe 'mergesort' do
    it 'should sort an array' do
      _(ms(@a)).must_equal @a.sort!
    end
  end
end
