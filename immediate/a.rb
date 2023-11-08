require 'colorize'

class MyMath
  def div(a, b)
    raise ZeroDivisionError if b == 0
    a / b
  end
end

class Test
  def self.inherited(k)
    def k.method_added(m)
      if m.start_with? 'test'
        puts "Test: #{m}".light_blue
        c = new
        if c.methods.include? :setup
          c.send :setup
        end
        c.send m
      end
    end
  end

  def assert(a)
    if a
      puts "#{a} is true! - test passed!"
      true
    else
      puts "#{a} is false! - test failed!"
      false
    end
  end

  def assert_equal(a, b)
    if a == b
      puts "#{a} == #{b} - test passed!"
      true
    else
      puts "#{a} != #{b} - test failed!"
      false
    end
  end

  def assert_raise(a, error_class)
    a.call
  rescue StandardError => e
    if e.instance_of?(error_class)
      print 'correct error message shown: '.green
      puts "#{error_class}"
    end
  end
end

class MyTest < Test
  def setup
    @calc = MyMath.new
  end

  def test_should_divide_integers
    assert_equal @calc.div(9, 3), 3
  end

  def test_should_raise_zerodiv
    assert_raise proc { @calc.div(9, 0) }, ZeroDivisionError
  end
end
