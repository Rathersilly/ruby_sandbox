a = proc { puts "proc a" }
b = proc { puts "proc b" }

def fun(a,b,&c)
  a.call
  b.call
  p c.call(5)
  p yield(7)
end
fun(a,b){ |x| x*x }

c = proc{ |*x| p x }
c.call(2)
c.call(1,2)
p c
p c.class

d = lambda { puts "a lambda" }
p d
p d.class

def fib(limit)
  a, b = 0, 1
  (1..limit).each do
    a, b = b, a + b
    yield a
  end
end
fib(10) { |x| puts x }
class C
  def talk
    puts "talking from #{self}"
  end
end
c = C.new
c.talk
m = c.method(:talk)
m.call
d = C.new

unbound = C.instance_method(:talk)
x = m.unbind # not error - x was bound
unbound.bind(d).call
unbound.bind(d)

#unbound.call - not sure why this one doesnt work after binding
#unbound = unbound.unbind # error - ub is stil still not bound
unbound.bind(c).call
