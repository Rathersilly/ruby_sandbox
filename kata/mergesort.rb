def merge(a, b)
  memo = []
  a = a.dup
  b = b.dup
  while !a.empty? || !b.empty?
    if a.empty?
      memo += b
      return memo
    elsif b.empty?
      memo += a
      return memo
    elsif a[0] < b[0]
      memo << a.shift
    else
      memo << b.shift
    end
  end
  memo
end

def ms(a)
  return a if a.size <= 1

  merge(ms(a[0..a.size / 2 - 1]), ms(a[a.size / 2..-1]))
end

a = (1..10).to_a.reverse

p a
p ms(a)

puts '==============='
mid = rand(10..20)
a = (1..mid).to_a
b = (mid..30).to_a
p a
p b
c = a + b
p c
p merge(a, b)
c = a + b
p c
