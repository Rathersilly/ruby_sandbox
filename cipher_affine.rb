# try a = 7 b = 5 with m = 'hello'
def modular_inverse(a)
  memo = 0
  (1..26).each do |i|
    if a * i % 26 == 1
      memo = i
      break
    end
  end
  memo
end

def affine_encrypt(m, a, b)
  res = ''
  m.each_char do |c|
    c = c.ord - 97

    res_char = (a * c + b) % 26
    res << (res_char + 97)
  end

  res
end

def affine_decrypt(m, a, b)
  res = ''
  mod = modular_inverse(a)
  m.each_char do |c|
    c = c.ord - 97

    res_char = mod * (c - b) % 26
    res << res_char + 97
  end

  res
end

m = 'hellothere'
a = 7
b = 5

puts "message = #{m}"
e = affine_encrypt m, a, b
puts "encrypted = #{e}"
d = affine_decrypt e, a, b
puts "decrypted = #{d}"
d = affine_decrypt 'dude', a, b
puts "decrypted = #{d}"
d = affine_decrypt 'nerd', a, b
puts "decrypted = #{d}"
('a'..'z').each do |c|
  puts "#{c} : #{affine_encrypt c, a, b}"
end
