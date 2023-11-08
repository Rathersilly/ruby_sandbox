# https://rossta.net/blog/pascals-triangle-with-rubys-enumerator.html
require 'minitest/autorun'

ary = [1]
def pascals_row(a)
  a = ([0] + a).zip(a + [0])
  a = a.map { |i, j| i + j }
  p a
end
10.times do |_i|
  ary = pascals_row(ary)
end
def pascals_triangle(row = [1])
  current = row
  Enumerator.new do |y|
    loop do
      y << current
      current = pascals_row(current)
    end
  end
end

class TestPascalsTriangle < Minitest::Test
  def test_pascals_row
    assert_equal [1, 1], pascals_row([1])
    assert_equal [1, 2, 1], pascals_row([1, 1])
    assert_equal [1, 3, 3, 1], pascals_row([1, 2, 1])
    assert_equal [1, 4, 6, 4, 1], pascals_row([1, 3, 3, 1])
    assert_equal [1, 5, 10, 10, 5, 1], pascals_row([1, 4, 6, 4, 1])
  end

  def test_pascals_triangle
    rows = pascals_triangle
    assert_equal [1], rows.next
    assert_equal [1, 1], rows.next
    assert_equal [1, 2, 1], rows.next
    assert_equal [1, 3, 3, 1], rows.next
    assert_equal [1, 4, 6, 4, 1], rows.next
    assert_equal [1, 5, 10, 10, 5, 1], rows.next
  end
end
pascals_triangle.with_index(1).take(10).each do |row, i|
  puts format("%d:%#{20 + (row.inspect.length / 2)}s", i, row.inspect)
end
