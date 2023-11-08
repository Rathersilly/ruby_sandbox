# frozen_string_literal: true

a = (1..10).to_a.shuffle

def mergesort(a)
  mid = a.length / 2
  left = a[0..mid - 1]
  right = a[mid..-1]
  p left, right
  if left.length <= 1 && right.length <= 1
    merge(left, right)
  else
    merge(mergesort(left), mergesort(right))
  end
end

def merge(a, b)
  memo = []
  loop do
    p a, b
    if (a == []) || a.nil?
      memo += b
      break
    elsif (b == []) || b.nil?
      memo += a
      break
    elsif a[0] <= b[0]
      memo << a.shift
    else
      memo << b.shift
    end
  end
  memo
end

p a
p mergesort(a)

p merge([1, 3, 4, 5, 8, 9], [2, 4, 6, 7, 8, 9])
