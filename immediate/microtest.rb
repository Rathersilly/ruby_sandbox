# WGR ch 15 MicroTest class - this is so fucking pretty
# some notes:
# calling subclass.instance_methods(false) at the beginning
# of self.inherited will return [] - because (obviously)
# any methods haven't been created yet

require 'colorize'
require './callertools'
class MicroTest

  def self.inherited(subclass)
    puts "#{self} just got subclassed by #{subclass}!".green
    subclass.class_eval do 

      def self.method_added(m)
        if m =~ /^test/
          c = self.new
          if c.methods.include?(:setup)
            c.send(:setup)
          end
          c.send(m)
        end
      end
    end
  end

  def assert(assertion)
    if assertion
      puts "Assertion passed"
      true
    else
      puts "Assertion failed"
      stack = CallerTools::Stack.new
      # found a good use for not (over !)
       p stack
      failure = stack.find { |call| not call.meth =~ /assert/ }
      puts failure
      false
    end
  end

  def assert_equal(expected, actual)
    result = assert(expected == actual)
    puts "(#{actual} is not #{expected})" unless result
    result
  end
end
if $0 == __FILE__
  class MyTest < MicroTest

    def initialize
      puts "init #{self.class}"
    end

    def setup
      puts "setting up".green
    end

    def test_the_truth
      puts "testing"
      assert(1)
      assert(nil)
      assert(1==1)
      assert 1==1 
    end

    def test_another_truth
      puts "testing another truth"
      a = 1
      b = 2
      assert a != b
      assert_equal a,b
      assert_equal 1,1
    end

  end
end

