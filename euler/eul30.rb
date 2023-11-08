#n = 1234

def check(n)
    a = n.to_s.split("")
    a.map!{ |x| x.to_i}
    sum = a.inject(0) {|memo,i| memo + i**5 }
    if n == sum
      puts "yep"
    end
    
end


def thing(num)
  n = 10
  goal = []
  num.times do
    n += 1
    a = n.to_s.split("")
    a.map!{ |x| x.to_i}
    #p a
    sum = a.inject(0) {|memo,i| memo + i**5 }
    #p sum
    if sum == n
      puts "***"
      puts n
      goal << n
    end
  end
  return goal
end

check(4150)
check(93084)
test = thing(355000)

#test = thing(10000)
sum = test.inject(:+)
p test
p sum
