#https://blog.appsignal.com/2016/11/23/ruby-magic-building-a-30-line-http-server-in-ruby.html
#
require 'socket'
server = TCPServer.new(4000)

while session = server.accept
  

  count = 0
  while request = session.gets
    puts request + count.to_s
    count += 1
    break if request =~ /EOM/
  end


  session.print "HTTP/1.1 200\r\n"
  session.print "Content-type: text/html\r\n"
  session.print "\r\n"
  session.print "Hello world! The time is #{Time.now}"


  
  session.close
end

