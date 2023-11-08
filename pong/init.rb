# initial grid
ROWS = 20
COLS = 20
def new_grid
  space = Array.new(ROWS) { Array.new (COLS){ ' . ' }}
  space.each_with_index do |row, i|
    row.each_with_index do |col, j|
      if i == 0
        row[j] = j.to_s
      elsif j == 0
        row[j] = i.to_s
      end
      
        
    end
  end
  space
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
