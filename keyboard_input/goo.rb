# OMG THIS WORKS TOO!
require 'io/console'
require 'io/wait'
STDIN.echo = false
STDIN.raw!
def char_if_pressed
  if STDIN.ready?
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
  end
  STDIN.cooked!
  input

  # STDIN.iflush
end
while true
  c = char_if_pressed
  puts "[#{c}], #{c.ord}" if c
  puts 'tick'
  if c == "\u0003"
    puts 'CONTROL-C'
    break
  end
  STDIN.raw!
  sleep 1

end
STDIN.echo = true
STDIN.cooked!
