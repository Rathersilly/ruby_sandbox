require 'openssl'
x = ''
key = ''
iv = ''
file = File.open("out2.txt") do |f|
  x = f.readline.chomp.force_encoding("ASCII-8BIT")
  key = f.readline.chomp.force_encoding("ASCII-8BIT")
  iv = f.readline.chomp.force_encoding("ASCII-8BIT")
end
puts "encrypted dump: #{x.dump.bytes}"
puts "***"
p x
puts "key: #{key}"
#key = '"' + key + '"'
puts "key: #{key}"
puts "key bytes: #{key.bytes}"
puts "key encoding: #{key.encoding}"
puts "key undump: #{key.to_s.undump}"
p iv
puts "iv bytes: #{iv.bytes}"
puts "iv undump: #{iv.undump}"
decipher = OpenSSL::Cipher.new(OpenSSL::Cipher.ciphers[0])
decipher.decrypt
puts "key: #{key}"
decipher.key = key.undump
decipher.iv = iv.undump
#puts iv.undump.bytes

#puts "decipher iv bytes: #{decipher.iv.bytes}"
decrypted = decipher.update(x) + decipher.final
p decrypted


