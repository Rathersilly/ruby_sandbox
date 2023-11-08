# t of hanoi problem
#
# each t represented with an array
# can test at any point by making sure array is sorted
def ppt
  Towers.each do |t|
    p t
  end
end
def ppt2
  max = 0
  Towers.each do |t|
    max = t.size if t.size > max
  end
  max.downto(1) do |n|
    Towers.each do |t|
      if t[-n]
        print " #{t[-n]} "
      else
        print "   "
      end
    end
    puts
  end
  puts "*" * 9
end

t1 = [1,2,3]
t2 = []
t3 = []
Towers = [t1,t2,t3]

# objective: make t3 = [1,2,3] by moving a single number
# to another array, never having an unsorted array

# first move is obvious - move 1 to another array. if it turns
# out the stack built on the wrong t, just change this position
# and the rest will work out

# find the smallest amount on a t
# move to an empty tower
#t2.unshift(t1.shift)

# now theres only one move that progresses:
#t3.unshift(t1.shift)

# again, only one move progresses:
# find smallest accessible amount
# select the array in towers that has the smallest first element


def getmin(array)
  puts "**"
  mina = []
  min = 100
  p min
  array.each do |t|
    if !t[0].nil? &&  t[0] < min
      min = t[0]
      mina = t
    end
  end
  mina
end
def getmin2
  # uh, i think this would suck for big arrays
  # dont need to transpose whole array if just need
  # first element of each
  trans = Towers.transpose[0]
  Towers[trans.index(trans.min)]
end
def getmax2
  # uh, i think this would suck for big arrays
  # dont need to transpose whole array if just need
  # first element of each
  trans = Towers.transpose[0]
  Towers[trans.index(trans.max)]
end

def go
  # base case
  # find empty
  tar = Towers.select { |t| t.empty?}.first
  if tar
    # find biggest element
    
    from = getmax2
    to = tar
  end
end
ppt2

ppt2

p getmin(Towers)





