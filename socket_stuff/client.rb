require 'socket'

hostname = 'localhost'
port = 4000

s = TCPSocket.open(hostname, port)

s.print "1Get / HTTP/1.1\r\n"
s.print "2Get / HTTP/1.1\r\n"
s.print "3Get / HTTP/1.1\r\n"
s.print "4Get / HTTP/1.1\r\n"
s.print "EOM"
#while line = s.gets
  #puts line.chomp
#end
s.print "5Get / HTTP/1.1\r\n"
s.print "EOM"
s.close

