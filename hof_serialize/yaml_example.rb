require 'yaml'
require 'colorize'

a = { name: 'alice', age: 99 }
b = { name: 'alice', age: 99, things: { thing1: 'asdf', thing2: 'ewrfef' } }
puts 'YAML.dump(x,f) to dump object x to file f'.green
File.open('asdf', 'w') do |f|
  YAML.dump(a, f)
  YAML.dump(b, f)
end

puts 'x = YAML.load(f) to load object x from file f: '.green
File.open('asdf', 'r') do |f|
  x = YAML.load(f)
  p x
end
y = 0
puts 'Use YAML#load_stream to load multiple objects. '.green
puts 'Will give you an array of hashes.'.green
File.open('asdf', 'r') do |f|
  y = YAML.load_stream(f)
  p y
end
puts "y.class: #{y.class}"
puts "y.inspect: #{y.inspect}"

y.each { |y| p y }

# returns enumerator
p y.select do |x|
  x[:things][:thing1] = begin
    'asdf'
  rescue StandardError
    nil
  end
end

# returns array
asdf = y.select do |x|
  x[:things][:thing1] = 'asdf'
rescue StandardError
end
p asdf
