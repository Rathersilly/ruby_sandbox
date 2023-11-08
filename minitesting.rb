# https://github.com/minitest/minitest
# COOL CHEATSHEET:
# https://devhints.io/minitest
# future HOF member

require 'minitest/autorun'
require 'minitest/pride'

module MyMath
  def self.add(a, b)
    # stdlib Warning#warn - sends msg to $stderr
    warn "HELLO THIS IS WARNING"
    a + b
  end
end

# this adds 'pride' to Minitest.extensions
asdf =Minitest::PrideIO.new($stdout)
2.times { puts asdf.pride('hello there') }
puts Minitest.backtrace_filter
puts Minitest.info_signal
puts Minitest.extensions

class TestAdd < Minitest::Test
  # Unit tests
  # Define your tests as methods beginning with test_.
  def setup
  end
  def teardown
  end
  def test_add
    assert_equal (1 + 2), MyMath.add(1, 2)
  end

  describe 'MyMath' do
    before do
      @a = [1, 2, 3]
      @x = 1
      @y = 3
    end

    it 'should add' do
      sum = MyMath.add(@x, @y)
      _(sum).must_equal 5
    end

    it 'should return itself' do
      # b = @a.my_each { |x| x += 2 }
      # _(b.object_id).must_equal @a.object_id
    end
  end
end
