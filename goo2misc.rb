module ASystem
  class << self
    def tick
      puts 'a'
    end
  end
end

module BSystem
  def tick
    puts 'b'
  end
end

class World
  Systems = []
  include ASystem
  include BSystem
  Systems << ASystem
  # Systems << BSystem
  def tick
    Systems.each do |sys|
      sys.tick
    end
    # ASystem.tick
    # BSystem.tick
  end
end

p World::Systems
w = World.new
w.tick

a = []
a << 2 << 3
p a

def asdf(a = 1, b)
  puts a
  puts b
end
asdf 2, 3

class JKL
  def initialize
    yield self
  end
end
puts "#{JKL}"
a = { JKL: 5 }
puts a
puts a[:JKL]

JKL.new do |c|
  puts self
  puts c
end
