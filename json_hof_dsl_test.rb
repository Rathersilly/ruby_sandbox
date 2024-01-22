require 'json'
require 'pp'
require 'colorize'
# require_relative 'person_class'
# TODO: create dsl with narrate(?) function
# that runs code while printing what its running to stdout
# that way you can run the program and have it describe what
# its doing.
# also add marshal here too - all serialization types
# https://blog.kiprosh.com/serialization_in_ruby_on_rails_part_one/

def narrate(&block)
  p block
end

narrate do
  puts 'reading .json file into string'.green
  json = File.read('json_sample.json')
  pp json
end
# exit

puts 'parsing json: '.green
obj = JSON.parse(json)
pp obj

puts 'generating json: '.green
my_hash = { hello: 'goodbye' }
my_hash2 = { name: 'bob', associates: { wife: 'anne', friend: 'edgar' } }

puts JSON.generate(my_hash)
puts JSON.generate(my_hash2)

# alternatively:
puts 'generating json (with to_json): '.green
puts my_hash.to_json
File.open('asdf', 'w') { |f| f.write my_hash.to_json }
x = File.read('asdf')
p x
puts 'Parsing'.green
puts JSON.parse(x)
File.open('asdf', 'a') { |f| f.write my_hash2.to_json }

puts 'Reading into x'.green
x = File.read('asdf')
puts 'x is a string: '.light_blue
p x

puts x

puts 'INFO: how to split a JSON string into records with regex'.yellow
puts "recs = #{x.split(/(?<=})(?={)/)}"
recs = x.split(/(?<=})(?={)/)
puts 'p recs:'.green
p recs
puts 'Parsing again:'.green
records = []
recs.each do |r|
  puts JSON.parse(r)
  records << JSON.parse(r)
end

pp records
puts "\nObject to JSON and JSON to Object".light_green

bob = Person.new(name: 'bob', age: 99, likes: %w[cats pizza])
puts 'bob = Person.new'.green
puts "p bob:                  #{p bob}"
puts "bob.to_json:            #{bob.to_json}"
File.open('asdf', 'w+') do |f|
  f.write bob.to_json
end
# NOTE, to_json may convert hash symbol keys to strings

puts 'person = Person.new(JSON.parse(bob.to_json))'.green
person = Person.new(JSON.parse(bob.to_json))

puts "person.class: #{person.class}"
puts "person.name: #{person.name}"
puts "person's methods work as expected: ".green
puts "person.hi -> #{person.hi}"
puts 'INFO: obj.to_json == JSON.dump(obj):'.yellow
puts "bob.to_json:            #{bob.to_json}"
puts "JSON.dump(person):      #{JSON.dump(person)}"
puts "JSON.generate(person):  #{JSON.generate(person)}"
