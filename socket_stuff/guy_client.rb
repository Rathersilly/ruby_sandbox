##############################
# tcp client
##############################
require 'socket'
require 'yaml/store'
require 'yaml'
require './person_class'
require 'colorize'

hostname = 'localhost'
port = 4000
s = TCPSocket.open(hostname,port)

# i think i see why transferring states is a good thing
state = :rec
msg = ''
while s

    while state == :rec
      puts "receiving\n"

      begin
        msg = s.gets
        puts msg
      end while msg  !~ /[A-Z]{3}/
      state = :send if msg =~ /RESPOND/
      state = :end if msg =~ /BYE/
    end
    s.close if state == :end
    puts s
    p s

    if state == :send
      puts
      print "messge to send: "
      name = gets.chomp
      s.puts name
    end
    state = :rec
end
