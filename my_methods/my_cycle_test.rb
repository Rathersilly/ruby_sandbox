require 'minitest/autorun'
require "./my_cycle"

describe Array do
  describe "my_cycle" do
    before do
      @a = [1,2,3]
      @b = []
    end

    it "should return nil if []" do
      a = []
      assert_nil(a.my_cycle)
    end
    # not sure how to test this
    # it "should loop forever" do
    # end
    it "should loop many times" do
      a = [1,2,3]
      b = []
      a.my_cycle(3) do |x|
        b << x * 2
      end
      _(b).must_equal [2,4,6] * 3
    end
  end
end

=begin
  describe "Array Benchmark" do
    if ENV["BENCH"] then
      bench_performance_linear "my_cycle", 0.999 do |n|
        100.times do 
          a.my_cycle(3) do |x|
            b << x * 2
          end
        end
      end
    end
  end
=end


