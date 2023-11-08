a = []
r = (1..9).to_a
# 3.times { a << r.shift(3) }
(1..9).each_slice(3) { |x| a << x }
p a
(1..9).each_cons(3) { |a| p a }

class Array
  def my_each_cons(n)
    len = n
    while n <= size
      yield self[n - len..n - 1]
      n += 1
    end
  self
  end
end
puts

b = (1..9).to_a
c = b.my_each_cons(3) { |x| p x }
puts "hihihi"
p c
