# https://www.thoughtco.com/making-deep-copies-in-ruby-2907749

a = [1, 2]
b = a
a << 3
puts b.inspect

a = [1, 2]
b = a.dup
a << 3
puts b.inspect
a = [[1, 2]]
b = a.dup
a[0] << 3
puts b.inspect

a = [[1, 2]]
b = Marshal.load(Marshal.dump(a))
a[0] << 3
puts b.inspect
