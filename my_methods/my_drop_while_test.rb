require 'minitest/autorun'
require "./my_drop_while"

describe self do
  describe "my_drop_while" do
    it "should stop when cond is false" do
      a = [1,2,3,4,5,4,6,7]
      b = a.my_drop_while { |x| x < 5 }
      
      _(b).must_equal [5,4,6,7]
    end
    it "should return enum with no block" do
      a = [1,2,3]
      e = a.my_drop_while
      _(e.class).must_equal Enumerator
    end

  end
end
