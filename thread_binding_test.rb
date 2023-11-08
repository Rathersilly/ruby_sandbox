threads = []
x = "hi"
puts "1" + x
threads << Thread.new(x) { |x| puts x}
threads << Thread.new(x) { |x| x = "hello" ;puts x}
threads.each { |t| t.join }
puts "4" + x


#a = [1,2]
a = "hi"
c = "hi"
x =  "yo"
y = "sup"
z = "huh"
bin = binding
t = Thread.new(a,bin) do |a, b|
  t[:b] = bin
  puts "t: binding id " + t[:b].object_id.to_s
  t[:a] =5
  p t[:a]
  puts "t: " + t[:a].object_id.to_s
  p t.inspect
  p Thread.current
  puts "t: " + b.object_id.to_s
  puts "t: " + a.object_id.to_s
  puts "t: " + b.local_variable_get(:z)
  puts "t: " + b.local_variable_get(:y)
end
w = Thread.new(a, bin) do |a, b |
  w[:b] = bin
  puts "    w binding id: " + w[:b].object_id.to_s
  sleep 0.5
  puts "    w: " + w[:a].to_s
  puts "    w: " + w[:a].to_s
  puts "    w: " + w[:a].object_id.to_s
  w[:a] = 2
  sleep 0.5
  puts "    w: " + w[:a].to_s
  b.local_variable_set(:y, "asdfsdf")
  
  p Thread.current
  puts "    w: " + b.object_id.to_s
  puts "    w: " + a.object_id.to_s
  puts "    w: " + b.local_variable_get(:z)
  puts "    w: " + b.local_variable_get(:y)
end

t.join
w.join

