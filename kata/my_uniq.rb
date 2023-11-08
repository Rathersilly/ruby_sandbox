def my_uniq(array)
  a = []
  array.each { |i| a << i unless a.include?(i) }
  a
end

class Array
  def my_uniq
    a = []
    each { |i| a << i unless a.include?(i) }
    a
  end

  def my_uniq!
    a = []
    each { |i| a << i unless a.include?(i) }
    replace(a)
  end
end

array = (1..10).to_a
array *= 2
p array.uniq
p array
puts 'p my_uniq(array)'
p my_uniq(array)
puts 'p array.my_uniq'
p array.my_uniq
puts 'p array.my_uniq!'
p array.my_uniq!
puts 'p array'
p array
# fooling around
p array.delete(4)
p array
p(array.reject { |a| a.even? })
p array.reduce(:+)
p array.reduce(1, :*)
array = (1..10).to_a
p array.reduce(1) { |memo, n| memo * n }
puts '***'
p array
# p array.reduce then block doesnt work - ambiguous block caller i think
b = array.reduce do |memo, n|
  memo + n
end
p b
b = array.reduce(1) do |memo, n|
  memo * n
end
p b
p(array.map { |a| a * 2 })
