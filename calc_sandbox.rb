s = '34+19-10+-10'
s = '1+ 4 + -3 + 7 - -3-1'
s = '1* 4 / -3 * 7 - -3-1'
s = '1* 4 / -3 * 7 - -3-1'
s = '(3+4)*2'
s = '(3+4)*2 - 1* 4 / -3 * 7 - -3-1 - (-4 - -5)'
s = '2+4*2+5/5'  # 11
tokens = %w[+ -]
tokens = '[+-\*]'
p tokens
p tokens.class

# nums = s.scan(/(?:[-+\*\/]|^)(-?\d+)/)
# notnums = s.scan(/([-+\*\/])(?:-?\d+)/)
# numless = s.gsub(/\d+/, "")
# tokens = s.scan(/([-+\*\/]|^)\s*(-?\d+)/)

nums = s.scan(%r{(?:[-+*/]|^)(-?\d+)})
notnums = s.scan(%r{([-+*/])(?:-?\d+)})
numless = s.gsub(/\d+/, '')
# tokens = s.scan(/([-+\*\/]|^)\s*(-?\d+)/)
# this won't find )
# tokens = s.scan(%r{([-+*/\(\)]|^)\s*(-?\d+)})

o = s.scan(/[^\d]+/)
print 'nums: '
p nums
print 'notnums: '
p notnums
p o

tokens = s.scan(%r{(-(?!\d)|\(|\)|[+*/]|-?\d+)\s*})
print 'tokens: '
p tokens
print 'tokens: '
tokens.flatten!
p tokens
tokens.delete('')
print 'tokens: '
p tokens

exp = '(3+4)*2 - 1* 4 / -3 * 7 - -3- -1 - (-4 - -5)' # 24.333
tokens = exp.scan(%r{(-(?!\d)|\(|\)|[+*/]|-?\d+)\s*}) # =>
tokens = exp.scan(%r{(\
                      -(?=\s*-)\
                      |\(|\)|[+*/]|-?\d+)\s*})  # =>

p tokens
