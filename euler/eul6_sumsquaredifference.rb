def sum_sq(n)
  i = 1
  memo = 0
  n.times do
    memo += i**2
    i += 1
  end
  memo
end

def sq_sum(n)
  i = 1
  memo = 0
  n.times do
    memo += i
    i += 1
  end
  memo **= 2
  memo
end

def sum_sq_diff(n)
  (sq_sum(n) - sum_sq(n))
end

p sum_sq(5)

p sq_sum(5)
p sum_sq_diff(5)
p sum_sq_diff(100)
