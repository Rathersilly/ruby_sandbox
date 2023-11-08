e = Enumerator.new do |y|
  i = 0
  loop do
    y << i * i
    i += 1
  end
end
p e.first(20)

def squares(n)
  acc = []
  n.times do |i|
    acc << i * i
  end
  acc
end
p(0..19).to_a.map { |x| x * x }
p squares(20)
