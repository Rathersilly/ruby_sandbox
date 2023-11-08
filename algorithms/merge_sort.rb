require 'minitest/autorun'

def merge(a, b)
  memo = []
  until a == [] && b == []
    if a == []
      memo << b.shift while b[0]
    elsif b == []
      memo << a.shift while a[0]
    elsif a[0] < b[0]
      memo << a.shift
    else
      memo << b.shift
    end
  end
  memo
end

def merge_sort(a)
  if a.size <= 1
    return a
  else
    merge(merge_sort(a[0..a.size/2-1]), merge_sort(a[a.size/2..-1]))
  end



end




a = (1..10).to_a.select { |x| x.odd? }
b = (1..10).to_a.select(&:even?)
c = a.shuffle
d = b.shuffle
e = (1..30).to_a.shuffle

p e
p merge_sort(e)
class TestMerge < Minitest::Test
  def test_merge
    assert_equal [1,2,3,4], merge([1,2],[3,4])
  end
  def test_merge_sort
    assert_equal (1..20).to_a, merge_sort((1..20).to_a.shuffle)
    assert_equal [1], merge_sort([1])
    assert_equal [], merge_sort([])
    assert_equal [1,4,5], merge_sort([5,4,1])

  end

end


