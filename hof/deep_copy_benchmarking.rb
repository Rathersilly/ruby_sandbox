# Benchmarking array copy and deep copy functions
require 'colorize'
require 'benchmark'

# Results/notes:
# dup vs clone:
# clone is faster than dup (2x)
# both make shallow copies. dup doesnt copy attributes
# like frozen status/singleton class, while clone does.
#
# to deep copy, just make your own function.
# marshalling is SLOW
# marshalling is for serialization, maybe faster than JSON?
# that i'd have to check

a = (1..100).to_a { }
n = 100
a = Array.new(n) { (1..n).to_a }
results = []

def my_deep_copy(a)
  memo = []
  a.each do |x|
    memo << x.dup
  end
  memo
end

def check_id(a,b)
  deep = false
  if a.object_id == b.object_id
    puts "\na and b are the same object"
  else
    puts "\na and b are different objects"
  end
  if a[0].object_id == b[0].object_id
    puts "a[0] and b[0] are the same object"
    deep = false
  else
    puts "a[0] and b[0] different objects"
    deep = true
  end
  puts
  deep
end

Benchmark.bm do |x|
  d = false

  r = x.report('copy: ') do
    b = a
    d = check_id(a,b)
  end
  results << [r.label, r.real, d]
  puts "*******************".green

  r = x.report('dup: ') do
    puts "DIFFERENCE BTW DUP AND CLONE:".light_blue
    puts "     *** dup will copy object, ignoring any special attributes".light_blue
    puts "     *** ie frozen status and singleton class".light_blue
    b = a.dup
    d = check_id(a,b)
    d = check_id(a,b)
  end
  results << [r.label, r.real, d]
  puts "*******************".green

  r = x.report('clone: ') do
    b = a.clone
    d = check_id(a,b)
  end
  results << [r.label, r.real, d]
  puts "*******************".green

  r = x.report('marshal: ') do
    b = Marshal.load(Marshal.dump(a))
    d = check_id(a,b)
  end
  results << [r.label, r.real, d]
  puts "*******************".green

  r = x.report('my_deep_copy: ') do
    b = my_deep_copy(a)
    d = check_id(a,b)
  end
  results << [r.label, r.real, d]
  puts "*******************".green

  p results
  print "Function".rjust(14).light_blue
  print "Time (ms)".rjust(14).light_blue
  print "Deep?".rjust(14).light_blue
  puts
  results.each do |x|
    print x[0].rjust(14) + (x[1] * 1000).round(5).to_s.rjust(14)
    print x[2].to_s.rjust(14)
    puts
  end
end




