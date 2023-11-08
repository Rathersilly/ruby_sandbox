require 'colorize'
encrypted = File.read("mbr_defrag.txt").split
earray = encrypted.dup

poem = ""
encrypted.each do |c|
  poem += c.to_i.chr
end  # => 
puts poem.lines[1].length.to_s.green
puts poem.lines[1].gsub(" ","").length.to_s.green
asquare = poem.lines[1].gsub(" ","").sub("Overa","")
puts asquare
puts asquare.size
poem.each_line do |line|  # => 
  puts line.length.to_s + " " + line.sub(" ","").length.to_s
end  # => 
puts "*****"

poema = poem.split(" ")
p poema
para = poem.split("\r\n\r\n")[0]

paralines = para.split("\r\n")

#puts para
puts
#p paralines
matrix = []
paralines.each do |x|
  x.gsub!(" ","")
  matrix << x


end
p matrix
matrix.each do |x|
  p x.size
end

#puts poem
#p encrypted;
#puts  encrypted.size.to_s.red
x = encrypted.delete("032")
#encrypted.delete("\r")
#encrypted.delete("\n")

require 'openssl'
cipher = OpenSSL::Cipher::AES256.new
cipher.decrypt
#cipher.key = File.read("mbr_defrag_key.txt")

bytearray = []
poss = []
poema.each_with_index do |w, i|
  savedi = i
  savedw = w
  bytes = 0
  a = ""
  while bytes < 33
    bytes += w.size
    a += w
    i += 1
    if bytes == 16 || bytes == 32
      poss << [savedw, savedi, a,bytes]
    end
    break if i >= poema.size
    w = poema[i]
  end
  bytearray << bytes
end
p bytearray
p poss

key = "allinplainsight."
#tried: ans.reverse + ans
#ans = ans.reverse + ans
# prev but sorted
# anssorted = ans.split('').sort.join
# sorted ans first then back + forwards
#ans = "allinplainsight.Accessisgranted."
#ans = ans.split('').sort.join
puts "XXXXX".green
#ans = "allinplainsight"
str = "clearinyourmind."
key = key.reverse + key
#str = str.reverse + str

cipher.key = key
cipher.iv = str

puts "key: #{str}"
puts "iv: #{key}"

ciphertext = File.read("mbr_defrag_ciphertext.txt")
plain = cipher.update(ciphertext)
p plain

x = <<-EOM
clea
riny
ourm
ind.
EOM
    



