require 'benchmark'

# interesting:  if - return is way faster than return - if
# makes sense though
#
# fib_num 3 and 4 are fastest, theres not significant diff.
# for loops arent faster as one site suggested

# yeah making enumerator is pretty but slow af
fib_enum = Enumerator.new do |y|
  prev = 0
  cur = 1
  loop do
    y << (sum = prev + cur)
    prev = cur
    cur = sum
  end
end
# returns array size n
def fib(n)
  prev = 0
  cur = 1
  ary = []
  n.times do |i|
    sum = prev + cur
    ary << sum
    prev = cur
    cur = sum
  end
  ary
end
# returns just nth fib #
def fib_num(n)
  prev = 0
  cur = 1
  n.times do |i|
    sum = cur + prev
    prev = cur
    cur = sum
  end
  cur
end
# returns just nth fib # also
def fib_num2(n)
  prev = 0
  cur = 1
  i = 0
  loop do
    sum = cur + prev
    prev = cur
    cur = sum
    i += 1
    if i == n
      break 
    end
  end
  cur
end
def fib_simplewhile(n)
  if n == 0
    return 0
  end
  prev = 0
  cur = 1
  i = 0
  while i < n
    sum = cur + prev
    prev = cur
    cur = sum
    i += 1
  end
  cur
end
def fib_simplerwhile n 
  if n == 0
    return 0
  end
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
def fib_beginwhile(n)
  if n == 0
    return 0
  end
  prev = 0
  cur = 1
  begin
    sum = cur + prev
    prev = cur
    cur = sum
    n -= 1
  end while n > 0 
  cur
end
def fib_num4(n)
  prev = 0
  cur = 1
  i = 0
  begin
    sum = cur + prev
    prev = cur
    cur = sum
    i += 1
  end while i < n
  cur
end
def fib_num5(n)
  prev = 0
  cur = 1
  i = 0
  begin
    cur, prev = cur + prev, cur
    i += 1
  end while i < n
  cur
end
# interesting -  if - return is way faster than return - if
# makes sense though
def fib_num6(n)
  prev = 0
  cur = 1
  i = 0
  loop do
    cur, prev = cur + prev, cur
    i += 1
    if i == n
      return cur
    end
  end
end
def fib_num7(n)
  prev = 0
  cur = 1
  i = 0
  loop do
    cur, prev = cur + prev, cur
    i += 1
    return cur if i == n
  end
end
def fib_num8(n)
  prev = 0
  cur = 1
  for i in 0..n
    cur, prev = cur + prev, cur
  end
  cur
end
def fib_num9(n)
  prev = 0
  cur = 1
  for i in 0..n
    cur, prev = cur + prev, cur
  end
  cur
end
def fib_num10 n 
  return 0 if n == 0
  return 1 if n == 1
  a = 0
  b = 1
  i = 2
  while i <= n
    a,b = b,a+b
    i += 1
  end
  b
end
def fib_recursion(n)
  return 0 if n == 0
  return 1 if n == 1
  return fib_recursion(n-1) + fib_recursion(n-2)
end



p fib(15)

n = 5000
Benchmark.bm do |x|
  x.report('enum') { fib_enum.lazy.first(n) }
  x.report('function') {fib(n).to_enum}
  x.report('just num') {fib_num(n)}
  x.report('just num2') {fib_num2(n)}
  x.report('simple while') {fib_simplewhile(n)}
  x.report('simpler while') {fib_simplerwhile(n)}
  x.report('begin while') {fib_beginwhile(n)}
  x.report('just num4') {fib_num4(n)}
  x.report('just num5') {fib_num5(n)}
  x.report('just num6') {fib_num6(n)}
  x.report('just num7') {fib_num7(n)}
  x.report('just num8') {fib_num7(n)}
  x.report('just num9') {fib_num7(n)}
  x.report('just num10') {fib_num10(n)}
  x.report('recursion') {fib_recursion(n)}
end
z = fib(30).to_enum.first(15)
p z
p fib_num(10)
p fib_num2(10)
puts "simplewhile: "
p fib_simplewhile(10)
p fib_simplerwhile(10)
p fib_beginwhile(10)
p fib_num5(10)
p fib_num6(10)
p fib_num7(10)
p fib_num8(10)
p fib_num9(10)
p fib_num10(10)
puts "recursion"
p fib_recursion(10)
puts "hi"
