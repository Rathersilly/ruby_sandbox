def caesar_encode(message, offset)
  ciphertext = ''
  message.each_char do |c|
    new_ord = c.ord + offset
    new_ord -= 26 if new_ord > 122
    ciphertext << new_ord.chr
  end
  ciphertext
end

def caesar_decode(message, offset)
  plaintext = ''
  message.each_char do |c|
    new_ord = c.ord - offset
    new_ord += 26 if new_ord < 97
    plaintext << new_ord.chr
  end
  plaintext
end


s = 'hellothere'
offset = 5
ciphertext = caesar_encode(s, offset)
puts ciphertext
puts caesar_decode(ciphertext,offset)
