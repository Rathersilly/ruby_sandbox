require 'minitest/autorun'

class MyEnum
  attr_accessor :elements

  def initialize(array)
    @a = array
    @cur = 0
    @max = @a.size - 1
  end

  def next
    tmp = @cur
    @cur += 1
    @cur = 0 if @cur == @max
    @a[tmp]
  end

  def each
    (0..@max).each do |i|
      yield @a[i]
    end
  end

  def peek
    @a[@cur]
  end
end

a = Array.new(5) { |i| i }
me = MyEnum.new(a)

e = a.to_enum
p e.next
p e.next
e.each { |x| puts x }
me.each { |x| puts x**x }

# hello.each {|x| puts x}

class MyEnumTest < Minitest::Test
  describe MyEnum do
    before do
      @e = MyEnum.new((1..5).to_a)
    end

    it 'should peek' do
      3.times { @e.peek }
      _(@e.peek).must_equal 1
    end
    it 'should next' do
      3.times { @e.next }
      _(@e.next).must_equal 4
    end
  end
end
