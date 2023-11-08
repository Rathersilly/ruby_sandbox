require 'io/console'
require 'io/wait'
#  $stdin.echo = false
#  $stdin.raw!
class Game
  def collide
  end
  def key_pressed #char_if_pressed
    if $stdin.ready?
      input = $stdin.read_nonblock(1) rescue nil
      if input == "\e" 
        input << $stdin.read_nonblock(3) rescue nil
        input << $stdin.read_nonblock(2) rescue nil
      end
    end
    input
  end

  def get_move(test_pos) # return uu
    row = test_pos[0]; col = test_pos[1]
    @move = key_pressed
    if @move
      print "move: #{@move[0]}"
      # sleep 1
      case @move
      when 'h' || '\e[D'
        puts 'h'
        col -= 1
      when 'j'
        row += 1
      when 'k'
        row -= 1
      when 'l'
        col += 1
      when "\u0003"
        exit
      when 'q'
        @quit_flag = true
      end
    else
      return nil
    end
    test_pos = [row, col]

    return test_pos
  end
end
