s = 'hello there'
x = s.match(/h(?<sup>ell)(?<yo>.)/)

p x
p x.captures
p x.named_captures
puts x["sup"]
puts x[:sup]
p x.post_match  # => 
p x.to_a

p x.regexp
p x[0]
x.each do |y| 
  p y
end

