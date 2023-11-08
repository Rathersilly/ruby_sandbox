##############################
# tcp server, reading data from yaml file and
# sending client
##############################
require 'socket'
require 'yaml/store'
require 'yaml'
require 'colorize'
require_relative 'person_class'

hostname = 'localhost'
port = 4000
server = TCPServer.new(hostname,port)


data = YAML.load_stream(File.read("people_data.yaml"))


while s = server.accept
  begin
    loop do
      found = false
      s.puts "welcome to the guy server"
      s.puts "which name would you like to search?RESPOND"
      name = s.gets.chomp
      if name =~ /quit/
        s.puts "FINE, quitting BYE"
      end
      puts "searching for name: #{name}".light_blue
      data.each do |x|
        break if name.empty?
        if x.name =~ /#{name}/
          s.puts "found #{x.name}\n \
          their age is #{x.age}\n \
          they dream of #{x.info[:dream]}"
          found = true
        end
      end
      if found == false
        s.puts "nobody by that name"
      end
    end
  rescue EOFError
    s.close
  end
end




