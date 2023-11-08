require 'socket'
require 'yaml/store'
require 'yaml'
require_relative 'person_class'

bob = Person.new(name: "bob",age: 30)

# this will create a new file "test_store.yaml"
store = YAML::Store.new "test_store.yaml"
store.transaction do
  store["bob"] = bob
  store["greeting"] = "hello world"
end

puts bob.hash.to_yaml
File.open('yamltest.yaml','w') {|f| f.write bob.hash.to_yaml}

# testing that we can use bob's data here in this file
bob2data = YAML.load(File.read('yamltest.yaml'))
bob2 = Person.new(bob2data)
puts bob2.name
puts bob2.info





# lets send bob across the ether
hostname = 'localhost'
port = 4000
#s = TCPSocket.open(hostname,port)

#Thread
while false# line = s.gets
  puts line.chomp
end




