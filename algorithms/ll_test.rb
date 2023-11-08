require 'minitest/autorun'
require './ll'

class LLTest < Minitest::Test
  def setup
    @ll = LinkedList.new
    100.times { |i| @ll.push i }
  end

  def test_push
    assert @ll.size == 100

    5.times { @ll.pop}
    assert @ll.pop == 94
    assert @ll.size == 94
  end
  def test_pop
    assert @ll.size == 100
    assert_equal @ll.size, 99
  end
  def test_shift
    assert @ll.size == 100
  end
end

