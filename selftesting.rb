puts "top"
puts self

class C
  puts "Class def"
  puts self
  puts self.object_id
  #p self

  def self.x
    puts "Class method"
    puts self
  puts self.object_id
  end
  def m
    puts "Instance Method"
    puts self
  puts self.object_id
  end
end

c = C.new
puts "------"
C.x
puts "------"
c.m

