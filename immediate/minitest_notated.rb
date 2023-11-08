# minitest_notated - see WGR S15.5

require 'minitest/autorun'

# create a class that inherites from Minitest::test
# you don't have to instantiate the class, autorun handles that
class MyTest < Minitest::Test
  # setup is run before each test
  def setup
    super
    @asdf = 2
  end

  def test_asdf
    # each assertion will be checked, but if one fails, the later
    # assertions in that test will not be checked
      assert 1 == 2
    # eg. these won't be checked
    assert 1 == 1
    assert @asdf == 2
  end
  def test_a
    assert_equal 1,1
    assert_equal 1,2
  end
end

