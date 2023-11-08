require 'minitest/autorun'
require './mergesort'

# minitest specs (describe/before/it notation)
describe self do
  before do
    @a = (1..10).to_a.reverse
  end

  # this would show main::ms::asdf#test_000#_should_sort...
  describe 'ms', 'asdf' do
    it 'should sort reversed array' do
      _(ms(@a)).must_equal (1..10).to_a
      assert_equal(ms(@a), (1..10).to_a)
    end

    it 'should sort different size arrays' do
      20.times do
        min = rand(1..10)
        max = rand(10..20)
        a = (min..max).to_a.shuffle
        assert_equal(ms(a), a.sort)
      end
    end

    it 'should merge different sized arrays' do
      mid = rand(10..20)
      a = (1..mid).to_a
      b = (mid..30).to_a
      assert_equal(merge(a, b), a + b)
      p merge(a, b)
      p a + b
    end

    it 'should sort when one or both arrays are empty' do
    end

    it 'should fail' do
      assert_equal(1, 2)
    end
  end
end

# minitest unit tests (class/setup/def notation)
class MyTest < Minitest::Test
  # class Minitest::Test
  def setup
    @a = (1..10).to_a.reverse
  end

  def test_reverses_reversed_array
    assert_equal ms(@a), (1..10).to_a
  end

  def test_sorts_different_size_arrays; end

  def test_sorts_empty_arrays; end

  def test_this_will_fail
    assert_equal 1, 2
  end
end
