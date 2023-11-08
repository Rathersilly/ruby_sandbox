##############################
# tcp client, converting ruby class to yaml and
# sending to server
##############################
require 'socket'
require 'yaml/store'
require 'yaml'
require './person_class'
require 'colorize'
#require_relative 'person_class'

bob = Person.new(name: "bob",age: 30)

# this will create a new file "test_store.yaml"
store = YAML::Store.new "test_store.yaml"
store.transaction do
  store["bob"] = bob
  store["greeting"] = "hello world"
end

# this is one way to do it - custom method
# could also have custom to_yaml method
bobyaml= bob.hash.to_yaml
puts "bobyaml:".light_blue
puts bobyaml

# but this another way - pretty simple
puts "bob Object to yaml:".light_blue
puts YAML.dump(bob)

File.open('yamltest.yaml','w') {|f| f.write bobyaml}

# testing that we can use bob's data here in this file
bob2data = YAML.load(File.read('yamltest.yaml'))
bob2 = Person.new(bob2data)
puts "Bob cloned: behold Bob2!".light_blue
puts bob2.name
puts bob2.info

# you don't need Person.new if you dumped a class object
# how neat!
#bob3 = Person.new(YAML.load(YAML.dump(bob)))

bob3 = YAML.load(YAML.dump(bob))

puts "Behold bob3!:".light_blue
puts bob3.name

# lets send bob across the ether
hostname = 'localhost'
port = 4000
s = TCPSocket.open(hostname,port)

s.write bobyaml
s.write "\nEOM"
s.close
#Thread
while false# line = s.gets
  puts line.chomp
end




