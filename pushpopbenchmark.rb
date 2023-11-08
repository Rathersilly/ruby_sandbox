require 'benchmark'

$a= (1..10000).to_a

def pushes(n)
  n.times do |i|
    $a.push(i)
  end
end

def unshifts(n)
  n.times do |i|
    $a.unshift(i)
  end
end
def pops(n)
  n.times do |i|
    $a.pop(i)
  end
end
def shifts(n)
  n.times do |i|
    $a.shift(i)
  end
end
n = 20000
Benchmark.bm do |x|
  x.report('push') { pushes(n) }
  x.report('unshift') { unshifts(n) }
  x.report('shift') { shifts(n) }
  x.report('pop') { pops(n) }
end

