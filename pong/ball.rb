
space = Array.new(20) { Array.new (40){ ' . ' }}
space.each_with_index do |row, i|
  row.each_with_index do |col, j|
    if i == 0
      row[j] = j.to_s
    elsif j == 0
      row[j] = i.to_s
    end
    
      
  end
  puts
end

def draw(a)
  system("clear")
  a.reverse.each_with_index do |row, i|
    row.each_with_index do |col, j|
      print col.center(3)
    end
    puts
  end
  puts
  puts
end
class Ball
  attr_accessor :pos, :x, :y, :vel
  def initialize

    @pos = [15,15] 
    @x = 15
    @y = 15
    @vel = [0,0]# [3,45]
  end
end

#loop - update position every second
# gravity - 9.8 m/s^2
t = 0
vx= 1 # 1 grid cell/second
vy = 1
ball = Ball.new
px = 1; py = 1
loop do
  x = ball.x; y = ball.y
  space[y][x] = " @ "
  space[py][px] = ' . ' if !py.nil?
  px = x ; py = y
  draw(space)
  #calclulate ball position
  ball.y += vy
  ball.x += vx
  if ball.y == space.size  
    ball.y -= 2
    vy= -vy
  elsif ball.y < 0
    ball.y += 2
    vy= -vy
  end
  if ball.x == space[0].size
    ball.x -= 2
    vx = -vx
  elsif ball.x < 0
    ball.x += 2
    vx = -vx
  end
    
  sleep 0.05
  #update grid
  #draw


  

   #break
end
draw(space)
