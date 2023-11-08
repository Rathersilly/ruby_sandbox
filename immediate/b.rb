require 'colorize'
class Calc
  def div a,b
    a/b
  end
end

class Test
  def self.inherited(k)
    def k.method_added(m)
      if m.start_with? 'test'
        c = self.new
        if c.methods.include? :setup
          c.send :setup
        end
        c.send m
      end
    end
  end

  def assert thing
    if thing == true
      puts "assertion is true"
      return true
    elsif
      puts "assertion is false"
      return false
    end
  end

  def assert_raise method, errortype
    begin
      method.call
    rescue => e
      if e.class == errortype
        puts "correct error thrown".green
      else
        puts "incorrect error thrown".red
      end
    end
  end


end
class MyTest < Test
  def setup
    @c = Calc.new
  end

  def test_divides_integers
    assert @c.div(9,3) == 3
  end
  def test_catches_zerodiv
    assert_raise proc { @c.div(9,0) },ZeroDivisionError
    assert_raise proc { @c.div(9,0) },StandardError
  puts "CALLER"
  puts caller
  end
end



