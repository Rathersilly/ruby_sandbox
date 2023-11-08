require 'minitest/autorun'

class Array
  def my_each
    c = 0
    while c < size
      yield(self[c])
      c += 1
    end
    self
  end

  def hi
    puts 'hi'
  end
end

a = [1, 2, 3]
# each doesnt return new array, but self
b = a.my_each { |i| puts i * 2 }
p a
p b
puts a.object_id
p b.object_id

class TestMy_Each < Minitest::Test
  describe Array do
    # both of these work the same
    # before do
    #   @a = [1,2,3]
    # end
    def setup
      @a = [1, 2, 3]
    end
    it 'should pass block' do
      x = 0
      @a.each { |n| x += n }
      _(x).must_equal 6
    end

    it 'should return itself' do
      b = @a.my_each { |x| x += 2 }
      _(b.object_id).must_equal @a.object_id
    end
  end
end
