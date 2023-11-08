require 'benchmark'
require 'colorize'
# find unit vector
include Math
a = [3,2]

r = Math.sqrt(a[0] ** 2 + a[1] ** 2)
p r

puts "benchmarking normalizing 2d vectors:".green
n = 500
Benchmark.bm do |x|
  x.report("calculating radius") do
    n.times do 
    r = Math.sqrt(a[0] ** 2 + a[1] ** 2)
    end
  end
  x.report("calculating atan") do
    n.times do
    r = Math.atan(3)
    end
  end
end


