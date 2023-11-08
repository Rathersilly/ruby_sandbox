# OMG THIS WORKS!
require 'io/console'
require 'io/wait'
STDIN.echo = false
# pretty sure STDIN.raw! flushes stdin
STDIN.raw!
begin
  # print "ready 1 = "
  # p STDIN.ready?
  input = begin
    STDIN.read_nonblock(1)
  rescue StandardError
    nil
  end
  if input == "\e"
    begin
      input << STDIN.read_nonblock(3)
    rescue StandardError
      nil
    end
    begin
      input << STDIN.read_nonblock(2)
    rescue StandardError
      nil
    end
  end
  STDIN.cooked!
  p input
  # print "ready 2 = "
  # p STDIN.ready?
  if input == "\u0003"
    puts 'CONTROL-C'
    break
    # exit 0
  end
  # p input

  STDIN.iflush
  puts 'tick'
  STDIN.raw!
  sleep 1

  # puts "ensure"
  # STDIN.echo = true
  # STDIN.cooked!
end while true
STDIN.echo = true
STDIN.cooked!
