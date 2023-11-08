require 'colorize'

# ok this is a program to show in interview maybe?
# i think hireme could be like a trireme though - like have it row across the screen
# this would be awesome with fractals imo


colors = %i[red blue green yellow]
class String
  def randcase
    memo = self
    result = ""
    memo.size.times do |i|
      if i.even?
        memo[i] = memo[i].upcase
      else
        memo[i] = memo[i].downcase
      end
    end
    self.replace(memo)
  end
end
while true

  case(rand(3))
  when 0
    yell = :upcase
  when 1
    yell = :downcase  
  when 2
    yell = :randcase
  end

  print "hire me ".send(yell).send(colors.sample)

end

memo = "hey there"
puts memo

puts memo.randcase



