# stdlib OptionParser class
#HOF candidate
require 'optparse'

options = {}
OptionParser.new do |opts|
  # if -h is an argument, shows this line
  # followed by list of options
  opts.banner = 'Usage: example.rb [options]'

  # OptionParser#on(*opts,&block)
  opts.on('-t', '--test', 'test desctiption','desc line 2','desc line 3') do |t|
    require 'minitest/autorun'
    class TestBubble < Minitest::Test
      def test_bubble_sort
        assert_equal (1..20).to_a, bubble_sort((1..20).to_a.shuffle)
      end
    end

    options[:test] = t
  end
end.parse!

puts "cmdline options: #{ options}"
puts "ARGV: #{ ARGV}"

def bubble_sort(arr)
  max_unsorted_index = arr.size - 1
  res = arr.dup

  while max_unsorted_index > 0
    i = 0
    while i < max_unsorted_index and res[i + 1]
      res[i], res[i + 1] = res[i + 1], res[i] if res[i] > res[i + 1]
      i += 1
      max_unsorted_index -= 1 if i == max_unsorted_index
    end
  end
  res
end
a = (1..10).to_a.shuffle
p a
p bubble_sort(a)


