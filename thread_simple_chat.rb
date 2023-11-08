# WGR ch 14.5.3 chat server

require 'socket'
def welcome(chatter)
  chatter.print 'Welcome! Please enter your name: '
  chatter.readline.chomp
end

def broadcast(message, chatters)
  chatters.each do |chatter|
    chatter.puts message
  end
end
s = TCPServer.new(3939)
chatters = []
while (chatter = s.accept)
  t = Thread.new(chatter) do |c|
    name = welcome(chatter)
    broadcast("#{name} has joined", chatters)
    chatters << chatter
    p chatter.class
    begin
      loop do
        line = c.readline
        puts line
        $stdout.flush
        if line.chomp.include?('quit')
          puts line
          $stdout.flush
          # c.close
          # t.exit
          p c
          $stdout.flush
          c.close
          p c
          $stdout.flush
          # t.terminate
        end
        broadcast("#{name}: #{line}", chatters) unless c.closed?
        break if c.closed?
      end
    rescue EOFError
      c.close
      chatters.delete(c)
      broadcast("#{name} has left", chatters)
    end
  end
end
