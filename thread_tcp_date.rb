# WGR ch 14.5+ -> sneaking into scopes

t = Thread.new do
  puts "Starting thread"
  sleep 0.5
  puts "at end of thread"
end
puts "outside thread"
# this wont get output until after next loop without flush
$stdout.flush

t.join

# WGR ch 14.5.2 - simple TCPserver 
require 'socket'
 s = TCPServer.new(3939)
 while (conn = s.accept)
   Thread.new(conn) do |c|
     c.print "Hi, what's your name? "
     name = c.gets.chomp
     c.puts "Hi #{name}. Here's the date: "
     c.puts `date`
     c.close
   end
 end


