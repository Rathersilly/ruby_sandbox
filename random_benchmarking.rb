require 'benchmark'

n = 10000
Benchmark.bm do |x|
  x.report("pre-array") do
    n.times do 
      a = ('a'..'z').to_a
      s = []
      16.times do |i|
        s << a.sample
      end
    end
  end

  x.report("array.new method") do
    n.times do
      a = Array.new(16){('a'..'z').to_a.sample}
    end
  end
  x.report("random numbers") do 
    n.times do |i|
      a = Array.new(16) {rand(26)}
    end
  end
  x.report("numbers to letters") do
    n.times do |i|
      a = Array.new(16) {rand(26)}
      a.map! {|n| (n+97).chr}
    end
  end
end

