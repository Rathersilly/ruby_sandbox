require_relative 'original_minitest'
def add(a, b)
  a + b
end

class MyTest < Test::Unit::TestCase
  def test_add
    assert_equal(add(1, 2), 3)
    assert_equal(add(1, 2), 4)
  end
end
