# not finished - not quite sure how to construct
# the enumerator that is returned
# when theres no block given
class Array
  def my_drop_while
    if !block_given?
      e = Enumerator.new do |y|
        i = 0
        while yield self[i]
          y << self[i]
          i += 1
        end
      end
      return e
        
    end
    i = 0
    memo = []
    memo = self.dup
    
    while i < size
      if yield(self[i])
        memo.shift 
      else
        break
      end
      i += 1
    end
    self.replace(memo)

  end
end
a = [2,4,6,4,7]
p a.my_drop_while{|x| x < 6 }

b = [1,2,3,2,4]
e = b.drop_while

p b.class
p e.class
puts "hi"
p e.each { |x| x < 3 }
p e.each
puts 
# e.each do |x|
#   puts x
#   puts e.next
#   true
# end
f = b.my_drop_while

f.each { |x| x < 3 }
f.each
