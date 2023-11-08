# in poke_place(n,x,y), n is dimensions of square grid
# x,y is position of a pokemon.
# the value of each cell is the distace from the pokemon
require 'colorize'

def poke_place(n, x, y)
  a = Array.new(n)
  n.times do |i|
    a[i] = Array.new(n, 0)
  end
  a[x][y] = 8
  a.each.with_index do |row, i|
    row.each_index do |j|
      # a[i][j] = [(i-x).abs,(j-y).abs].max
      a[i][j] = Math.sqrt((i - x).abs**2 + (j - y).abs**2).to_i
    end
  end
end

def print_array(arr)
  arr.size.times do |x|
    arr[0].size.times do |y|
      print arr[x][y]
    end
    puts
  end
end

def get_coords
  print 'Enter x,y: '
  input = gets.chomp
  p input.match(/(\d+),/)
  x = input.match(/(\d+),/)[1]
  y = input.match(/,(\d+)/)[1]
  [x, y]
end

coords = get_coords
p coords
a = poke_place(8, 3, 4)
print_array a


