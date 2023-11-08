# frozen_string_literal: true

# dict = './asdf/few-words'
dict2 = '/home/rathersilly/american-english'

# array = File.readlines(dict)
# p array
array2 = File.readlines(File.readlink(dict2))
20.times do |i|
  print array2.sample(4).join("-").gsub(/\n/,"")
  puts
end

p array2.find_all { |i| i =~ /hrol/}
p array2.find_all { |i| i =~ /krak/}
                  

 
 

