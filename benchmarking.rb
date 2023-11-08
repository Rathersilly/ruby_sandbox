require 'benchmark'
require 'benchmark/ips'
require 'colorize'

def fib_recursion n
  return 0 if n == 0
  return 1 if n == 1
  return fib_recursion(n-1) + fib_recursion(n-2)
end

def fib_simple n 
  if n == 0
  end
    return 0
  prev = 0
  cur = 1
  while n > 0
    sum = prev + cur
    prev = cur
    cur = sum
    n -= 1
  end
  cur
end

# How to benchmark things in ruby
puts "*".green * 40
puts "How to benchmark things in ruby".upcase.center(40,'*')
puts "*".green * 40
puts "Constants in Benchmark: CAPTION and FORMAT"
puts "CAPTION: #{Benchmark::CAPTION}"
puts "FORMAT: #{Benchmark::FORMAT}"
puts "Benchmark#measure(label = \"\") {block to bm}".light_blue
puts "sine(3)"
puts  Benchmark.measure("sin") {1000.times { Math.sin(3) } }
puts "cos(3)"
puts  Benchmark.measure {1000.times { Math.cos(3) } }
x = Benchmark.measure {1000.times { Math.cos(3) } }
puts "Benchmark#measure returns class #{x.class}".cyan
puts "inspecting it shows this:".cyan
pp x
puts "Benchmark#realtime {block to bm} ".light_blue
x = Benchmark.realtime { puts "\thi im in a block" }
puts "Benchmark#realtime returns class #{x.class}: #{x}".cyan

puts
puts "Benchmark#benchmark(caption = \"\", label_width = nil, format = nil, *labels)".light_blue
n = 10
Benchmark.benchmark do |x|
  x.report('fib recursion') { 1000.times { fib_recursion(n) } }
  x.report('fib simple') { 1000.times { fib_simple(n) } }
end
puts "Benchmark#bm(label_width = 0, *labels)".light_blue
puts "note: recursion here only usable for small n".yellow
puts "if n > like 10, recursive fn starts to take forever".yellow
Benchmark.bm(10) do |x|
  x.report('fib recursion') { 1000.times { fib_recursion(n) } }
  x.report('fib simple') { 1000.times { fib_simple(n) } }
end

puts "Benchmark#bmbm(width = 0) ".light_blue
Benchmark.bmbm do |x|
  x.report('fib recursion') { fib_recursion(n) }
  x.report('fib simple') { fib_simple(n) }
end

  
puts "benchmark/ips gem (iterations per second)".light_blue
Benchmark.ips do |x|
  #x.report('fib recursion') { fib_recursion(n) }
  #x.report('fib simple') { fib_simple(n) }
  #x.compare
end
