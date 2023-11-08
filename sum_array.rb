require 'colorize'

# just trying to sum the elements of 2 arrays
# inspired by stroustrup ppp ch19 ex 1

a = (1..10).to_a
b = (1..30).to_a
x = (1..10).to_a

c = []
d = Array.new([a.size,b.size].max) do |i|
  if a[i] && b[i]
    a[i] + b[i]
  elsif !a[i]
    b[i]
  else
    a[i]
  end
end
puts d.to_s.green

i = 0
loop do
  if !a[i] && !b[i]
    break
  elsif a[i] && b[i]
    c << a[i] + b[i]
  elsif !a[i]
    c << b[i]
  elsif !b[i]
    c << a[i]
  end
  i += 1
end
puts c.to_s.yellow

# neater but doesnt handle diff sizes
p [a,x].transpose.map{|q| q.reduce(:+)}
# neater still
p [a,x].transpose.map{|q| q.sum}

p a.zip(b).map{|q| q.reduce(:+)}
# neatest
p a.zip(b).map{|q| q.sum}
# woooo diff size arrays summed with one line!
# have to have the bigger array call zip though
# a zip and 3 maps! awesome!
p b.zip(a).map { |n| n.map{|m| m||0}}.map{|n| n.sum}

def asum(a,b)
  if a.size > b.size
    a.zip(b).map { |n| n.map{|m| m||0}}.map{|n| n.sum}
  else
    b.zip(a).map { |n| n.map{|m| m||0}}.map{|n| n.sum}
  end
end
def asumugly(a,b)
  a.size > b.size ? a.zip(b).map { |n| n.map{|m| m||0}}.map{|n| n.sum} : b.zip(a).map { |n| n.map{|m| m||0}}.map{|n| n.sum}
end

p asum(a,b)
p asum(b,a)
p asumugly(b,a)


e = [1,nil,3]
p e.map{|n| n||0}

 
