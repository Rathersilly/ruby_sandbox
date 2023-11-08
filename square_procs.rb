square = ->(x) {  x*x }
puts square.call(4)
s2 = proc{|x| x*x}
puts s2.call(3)

s3 = lambda {|x| x*x}
puts s3.call(7)

num = 7
s5 = proc {|x| x*num}
puts s5.call(2)
s6 = lambda {|x| x*num}
puts s6.call(9)
s7 = ->(x) { x*num}
puts s7.call(9)
def fun a
  puts a.call(11)
end
fun(s7)
