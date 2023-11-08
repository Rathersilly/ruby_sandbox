def a(skip)
  caller(skip)
end
def b(skip)
  a(skip)
end
def c(skip)
  b(skip)
end
p c(0)   #=> ["prog:2:in `a'", "prog:5:in `b'", "prog:8:in `c'", "prog:10:in `<main>'"]
p c(1)   #=> ["prog:5:in `b'", "prog:8:in `c'", "prog:11:in `<main>'"]
p c(2)   #=> ["prog:8:in `c'", "prog:12:in `<main>'"]
p c(3)   #=> ["prog:13:in `<main>'"]
p c(4)   #=> []
p c(5)   #
 
