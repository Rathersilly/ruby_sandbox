#https://blog.appsignal.com/2016/11/23/ruby-magic-building-a-30-line-http-server-in-ruby.html
#
require 'socket'
require 'rack'
require 'rack/lobster'
require 'net/http'

# app = Proc.new do
#   ['200', {'Content-type' => 'text/html'},
#    ["Hello world! The time is #{Time.now}"]]
# end
app = Rack::Lobster.new
server = TCPServer.new 4000
class TeeIO < File
  def print(string)
    $stdout.print string
    super(string)
  end
end
log = TeeIO.open('log', 'a')

while session = server.accept

  method, full_path = request.split(" ")
  path, query = full_path.split("?")

  status, headers, body = app.call({
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    'QUERY_STRING' => query
  })

  session.print "HTTP/1.1 #{status}\r\n"
  headers.each do |k,v|
    session.print "#{k}: #{v}\r\n"
    print "#{k}: #{v}\r\n"
  end
  session.print "\r\n"
  body.each do |part|
    session.print part
    print part
  end
  
  session.close
end

