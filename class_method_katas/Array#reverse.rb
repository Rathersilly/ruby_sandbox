require 'minitest/autorun'
#
# Array#my_reverse
class Array
  def my_reverse
    # both of these work
    tmp = []
    tmp2 = []

    (size - 1).downto(0) { |i| tmp2 << self[i] }

    reverse_each { |x| tmp << x }

    # tmp
    tmp2
  end
end
a = [1, 2, 3]
p a.reverse
p a.my_reverse

describe Array do
  before do
    @a = [1, 2, 3]
  end

  describe 'my_reverse' do
    it 'should reverse an array' do
      _(@a.my_reverse).must_equal @a.reverse
    end
  end
end
