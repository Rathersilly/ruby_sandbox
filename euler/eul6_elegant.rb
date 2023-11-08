def sum_sq_diff(n)
  a = (1..n).inject { |memo, i| memo + i }**2
  b = (1..n).map { |x| x**2 }.inject { |memo, i| memo + i }
  a - b
end

def ssd_elegant(n)
  a = (1..n).sum**2
  b = (1..n).map { |x| x**2 }.sum
  a - b
end
p sum_sq_diff(10)
p sum_sq_diff(100)

p ssd_elegant(10)
p ssd_elegant(100)
