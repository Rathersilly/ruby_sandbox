require 'pp'
def pretty(array)
  array.each do |x|
    p x
  end
end
def s2da(s) # string to 2d array
  a = []
  s.each_line do |line|
    a << line.chomp.split('')
  end
  a
end
TET_L = s2da("\
L 
L 
LL")

a = Array.new(3){Array.new(3)}
p a
i = 1
a.each_index do |r|
  a[r].each_index do |c|
    a[r][c] = i
    i += 1
  end
end

pretty a
puts
pretty a.transpose
puts
pretty a.transpose.reverse

pretty TET_L

puts "---"
pretty TET_L.transpose.reverse # ccw once
pretty TET_L.reverse.transpose # cw once
pretty TET_L.transpose.reverse.transpose.reverse # rotated 2x:
pretty TET_L.transpose.reverse.reverse.reverse.reverse # no - flipped



