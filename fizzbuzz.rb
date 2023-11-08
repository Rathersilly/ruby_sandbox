# print fizzbuzz from 1 to n
def fb_print_all(n)
  (1..n).each do |num|
    puts fb_calc(num)
  end
end

def fb_calc(num)
  num_array = [3, 5]
  word_array = %w[fizz buzz]
  output = ''
  num_array.each.with_index do |x, i|
    output << word_array[i] if num % x == 0
  end
  output.empty? ? num : output
end

def fb(n)
  (1..Float::INFINITY).lazy.map { |i| fb_calc(i) }.first(n)
end

def fb_enum
  (1..Float::INFINITY).lazy.map { |i| fb_calc(i) }
end
# fb(30)

# fb_calc(15)

puts fb_calc(15)
puts fb(30)

e = fb_enum
puts e.class
20.times do
  puts e.next
end
