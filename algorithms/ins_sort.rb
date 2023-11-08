#require 'minitest/autorun'
# require 'pry'
# require 'pry-byebug'

def ins_sort a
  a.each.with_index do |x,i|
  end
end



array = (1..10).to_a.reverse
p ins_sort(array)

# array = (1..20).to_a.shuffle
# p ins_sort(array)

array = [1,2,3]
p ins_sort(array)
exit
class SortTest < Minitest::Test
  describe "ins_sort" do
    it 'should sort reversed array' do
      array = (1..10).to_a.reverse
      _(ins_sort(array)).must_equal (1..10).to_a
    end
    it 'should sort random array' do
      array = (1..20).to_a.shuffle
      _(ins_sort(array)).must_equal (1..20).to_a
    end

  end
end
