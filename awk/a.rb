require 'colorize'
f = File.open('coins.txt')
text = f.readlines

lines = []
 
text.each do |line|

  m = line.match(/([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+(.+)/)
  p m
  p m[0]
  p m[1]
  lines << m[1..5]


  # this will not preserve multiple spaces in last column
  # line.gsub!(/\s{2,}/,'=')
  # a = line.split(' ')
  # a[4] = a[4..].join(' ')
  # lines << a[0..4]


end
puts 'lines'.green
pp lines
f.close
f = File.open('coins.csv','w')
lines.each do |line|
  f.write line.join(",")
  f.write "\n"
end
f.close



