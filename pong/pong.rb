require './init'
require './keyboard'

grid = new_grid
class Ball
  attr_accessor :pos, :x, :y, :vx, :vy
  def initialize
    @vx = 1
    @vy = 1
    @x = 15
    @y = 15
    @vel = [0,0]# [3,45]
  end
end

class Game
  def initialize
    @ball = Ball.new
    start_game
  end
  def start_game
    grid = new_grid
    px = nil; py = nil # prev ball positions
    loop do
      x = @ball.x; y = @ball.y
      vx = @ball.vx; vy = @ball.vy
      grid[y][x] = " @ "
      grid[py][px] = ' . ' if !py.nil?
      px = x ; py = y
      draw(grid)
      #calclulate ball position
      y += vy
      x += vx
      if y == grid.size  
        y -= 2
        vy= -vy
      elsif y < 0
        y += 2
        vy= -vy
      end
      if x == grid[0].size
        x -= 2
        vx = -vx
      elsif x < 0
        x += 2
        vx = -vx
      end
        
      #$stdin.raw!
      sleep 1

      #$stdin.cooked!

      #update grid
      #draw
    end
    draw(grid)
  end
end
Game.new
