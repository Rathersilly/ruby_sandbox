require './a'

class Klass

  def add(a,b)
    puts "in a"
    return a-b
  end
end

puts Klass.new.add(2,3)

class MyTest < Test
  def setup
    @k = Klass.new

    @a = 7
    @b = 32
  end

  def test_add_two_positive_numbers
    puts @k.add(@a,@b)
    assert(@k.add(@a,@b) == 39)
    if not assert(@k.add(@a,@b) == 39)
      fun = get_method("b.rb",:add)
      p fun
      Klass.class_eval(fun)
    end
    assert(@k.add(@a,@b) == 39)
    puts "***".yellow




    puts "this is 7+32 == 36"
    assert(@a+@b == 36)
    assert_equal(@a+@b,39)
  end

  def asdftest_add_two_negative_numbers
    assert(-@a + -@b == -39)
    assert(-@a + -@b == -41)
    assert_equal(-@a+-@b,41)
  end

end




