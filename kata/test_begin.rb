# frozen_string_literal: true

# test class from testing for beginners
# http://testing-for-beginners.rubymonstas.org/testing/classes.html
require 'colorize'

class Test
  def initialize
    @tests = 0
    @passes = 0
    @fails = 0
  end

  def run
    tests = methods.select { |m| m.to_s.start_with?('test_') }
    @tests = tests.size
    tests.each { |test| send(test) }

    summarize
  end

  def assert_true(actual)
    assert_equal(true, actual)
  end

  def assert_false(actual)
    assert_equal(false, actual)
  end

  def assert_equal(expected, actual) # add method name maybe
    puts caller[0].green
    if expected == actual
      puts "     #{expected} equals #{actual} as expected!"
      @passes += 1
    else
      puts '     KAPUT'.red + " #{expected} doesn't equal #{actual}"
      @fails += 0
    end
    puts
  end

  def summarize
    print "#{@tests} tests, ", "#{@passes} passes".green + ', ' + "#{@fails} fails".red + '.'
    if @passes > 1 && @fails == 0
      6.times do
        win_str = '     WELL DONE, CHAMPION     '
        print win_str.blue.on_cyan
        sleep 0.3
        print "\e[#{win_str.length}D"
        print win_str.black.on_cyan
        sleep 0.3
        print "\e[#{win_str.length}D"
      end
      puts
    end
  end
end
