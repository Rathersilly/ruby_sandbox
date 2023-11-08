f = File.new('my_each.rb')
# puts f.read

c = 1
loop do
  line = f.gets
  break unless line

  print "#{c} "
  puts line

  c += 1
end
f.rewind
while line = f.gets
  print "#{c} "
  puts line

  c += 1
end
f.rewind
lines = f.readlines
puts '*******'
puts lines[1]

begin
  g = File.open('nosuchfile')
rescue StandardError => e
  puts 'rescuing'.upcase.center(30, 'Xx')
  puts $!
  p e
  puts e.inspect
  p e.inspect
  p e.message
end
