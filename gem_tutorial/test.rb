require 'hola'

Hola.hi

module A
  X = "Hi im constant"
  def self.hi
    puts "hi im a module singleton method"
  end
end

A.hi
puts A::X

puts Hola.hi "english"
puts Hola.hi "spanish"
