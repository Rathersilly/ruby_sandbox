require 'openssl'
def be(s)
  s.chars.map { |c| (c.ord+1).chr }.join
end
def bd(s)
  s.chars.map { |c| (c.ord-1).chr }.join
end

class Dude
  attr_accessor :name
  def initialize
    @name = "bob"
    @age = 42
  end
end

d = Dude.new
m = Marshal.dump(d)
x = be(m)
file = File.open("out.txt", "w") do |f|
  f.puts x
end

d2 = Dude.new
d2.name = "mortimer"
cipher = OpenSSL::Cipher.new(OpenSSL::Cipher.ciphers[0])
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv
data = Marshal.dump(d2)
data = "hello there"
encrypted = cipher.update(data) + cipher.final

p encrypted
puts "!!!"
puts encrypted.encoding
puts key.encoding  # => ;
puts key.dump.encoding
puts "key: #{key}"
puts "key bytes: #{key.bytes}"
puts "key dump bytes: #{key.dump.bytes}"
puts "key dump encoding: #{key.dump.encoding}"
puts "key dump: #{key.dump}"
puts key.dump.undump == key
puts "iv: #{iv}"
puts "iv dump bytes: #{iv.dump.bytes}"
puts "encrypted dump: #{encrypted.dump.bytes}"
$stdout.flush
file = File.open("out2.txt", "w") do |f|
  f.puts encrypted.dump
  f.puts key.dump#.force_encoding("UTF-8")
  f.puts iv.dump#.force_encoding("UTF-8")
end
exit
puts "hi"
decipher = OpenSSL::Cipher.new(OpenSSL::Cipher.ciphers[0])
decipher.decrypt
decipher.key = key
puts "key: #{key}"
decipher.iv = iv
decrypted = decipher.update(encrypted) + decipher.final
p decrypted
#d3 = Marshal.load(decrypted)
#p d3
p decrypted.class
