def perms(a)
  return a if a.size == 1

  memo = []
  a.each do |n|
    b = a.dup
    b.delete(n)
    perms(b).each do |perm|
      memo << ([n] + [perm]).flatten
    end
  end
  memo
end

p perms([1, 2, 3])
p perms([1, 2, 3, 4])
