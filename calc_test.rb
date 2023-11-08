doc = <<~EOM
  calculator loop structure

  just */ and +- for now

  loop through string, replace all */ with eval

  loop through string again, replace all +- with eval

  then you're done!

EOM
require 'minitest/autorun'
require './calc_2'

describe Calc do
  before do
    @c = Calc.new
  end

  describe 'calc' do
    it 'should add and subtract' do
      _(@c.calc('3+7+9')).must_equal 19
      _(@c.calc('1+2+3-4+5')).must_equal 7
      _(@c.calc('3-7-9')).must_equal(-13)
      _(@c.calc('3-12+9')).must_equal 0
    end
    it 'should multiply and divide' do
      _(@c.calc('3*5')).must_equal 15
      _(@c.calc('3*100*2')).must_equal 600
      _(@c.calc('12/3/2')).must_equal 2
      _(@c.calc('3*12/9*2')).must_equal 8
      _(@c.calc('3*12*0')).must_equal 0
    end
    it 'should handle brackets' do
      _(@c.calc('(3+5)*2')).must_equal 16
    end
    it 'should tokenize weird negatives' do
      exp = '3 - 5'
      _(@c.tokenize(exp)).must_equal %w[3 - 5]
      exp = '3- -5'
      _(@c.tokenize(exp)).must_equal %w[3 - -5]
      exp = '3- 5'
      _(@c.tokenize(exp)).must_equal %w[3 - 5]
      exp = '-3- -5'
      _(@c.tokenize(exp)).must_equal %w[-3 - -5]
      exp = '(-4 - -5)'
      _(@c.tokenize(exp)).must_equal %w[( -4 - -5 )]
      exp = '7 - -3-1'
      _(@c.tokenize(exp)).must_equal %w[7 - -3 - 1]
    end
  end
end
