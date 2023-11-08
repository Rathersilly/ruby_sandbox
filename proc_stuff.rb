hi = Proc.new { puts "hi"}
pr = Proc.new { |x| x*x }
p (1..10).map(&pr)

def fun(&b)
  x = 2
  b.call(x)
end

def foo(a)
  p (1..5).to_a.map(&a)
  a.call(20)
end

def goo(a)
  a.call
  yield
end

goo(hi) { puts "hello"}



p fun { puts "hi" }
p fun(&pr)

puts "***"*5
puts foo(pr)

puts
things = []
5.times do |i|
  things << Proc.new { |x| x * i}
end


puts "---------"
5.times do |i|
  p things.sample
  p [i].map(&things.sample)
end
h = {hi: "hello", yo: "sup", hey: "heyyyyyy"}
hp = h.to_proc
p [:hi, :hey].map(&hp)


odd = proc(&:odd?)
asdf = Proc.new { |x| x * 9 }
square = Proc.new { |x| x ** 2 }
10.times do |a|
  case a
  when odd
    puts "hi"
  when odd
    puts "hihihihihi"
  else
    puts 'sup'

  end
end

p odd.call(1)
p odd === 1


p square.call(4)
p square === 4

