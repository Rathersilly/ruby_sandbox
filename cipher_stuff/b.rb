require './a.rb'  # => 
x = ""
file = File.open("out.txt") do |f|
  x = f.read
end
p x
p bd(x)

x = bd(x)
dude = Marshal.load(x)
p dude.name
