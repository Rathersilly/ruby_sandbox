##############################
# tcp server, converting ruby class to yaml and
# sending to server
##############################
require 'socket'
require 'yaml/store'
require 'yaml'
require 'colorize'
require_relative 'person_class'

hostname = 'localhost'
port = 4000
server = TCPServer.new(hostname,port)

alldata = ""
#while session = server.accept
session = server.accept
  while data = session.gets
    break if data =~ /EOM/
    alldata << data
    puts data.green
  end
  puts "here"
  session.close 
puts alldata

bob2 = Person.new(YAML.load(alldata))
puts "#{bob2.name} has been teleported!"


