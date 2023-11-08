# Simple demonstration of dumping and loading
# ruby objects to and from yaml
require 'colorize'
require 'pry'
require 'yaml'

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
outfile2 = "tmp/out2.yaml"
# these do the same thing
File.open(outfile, 'w') { |f| YAML.dump(people, f) }
File.open(outfile2, 'w') { |f| f.write(YAML.dump(people)) }
puts "after loading from file".green
new_people = YAML.load(File.read(outfile))
pp new_people

a = Array.new(10) { |i| Array.new(10) { |j| i * j } }
pp a
a_yaml = YAML.dump(a)
#pp a_yaml
b = YAML.load(a_yaml)
pp b



  


