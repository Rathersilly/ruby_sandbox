# Simple demonstration of dumping and loading
# ruby objects to and from yaml
require 'colorize'
require 'yaml'
require 'pry'

# ruby YAML references:
# https://ruby-doc.org/stdlib-3.1.2/libdoc/yaml/rdoc/YAML.html
# https://yaml.org/YAML_for_ruby.html
 
class Person
  attr_accessor :name, :email
  def initialize(**opts)
    @name = opts[:name]
    @email = opts[:email]
  end
end
people = []

5.times do |i|
  people << Person.new(name: "person#{1}",
                       email: "person#{1}@asdf.com")
end
puts "before loading to file".yellow
pp people
outfile = "tmp/out.yaml"
# File.open(outfile, 'w') { |f| YAML.dump(people, f) }
puts "after loading from file".green
new_people = YAML.load(File.read(outfile))
pp new_people

puts "does people(before yaml dump) == new_people(read from yaml)?".yellow
if people == new_people
  puts "OMG THEY ARE THE SAME!".green
else
  print "nope: ".red
end
puts "what happens is the people have different object_ids".light_blue
puts "but nevertheless there are people with the same attributes".light_blue

a = Array.new(10) { |i| Array.new(10) { |j| i * j } }
#pp a
a_yaml = YAML.dump(a)
#pp a_yaml
b = YAML.load(a_yaml)
#pp b

# demonstration of Marshal, why not
mars = Marshal.dump(a)
mars2 = Marshal.load(mars)
#pp mars
#pp mars2
p a == mars2 # true
