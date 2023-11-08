require 'openssl'
#ciph = OpenSSL::Cipher.ciphers.sample
data = "hey whats going on here?"
c = OpenSSL::Cipher.ciphers[0]
p c
cipher = OpenSSL::Cipher.new(c)
p cipher
cipher.encrypt
key = cipher.random_key
p key
iv = cipher.random_iv
p iv
encrypted = cipher.update(data) + cipher.final
p encrypted
decipher = OpenSSL::Cipher.new(c)
decipher.decrypt
decipher.key = key
decipher.iv = iv

plain = decipher.update(encrypted) + decipher.final
p plain

data2 = "ok what now?"
cipher2 = OpenSSL::Cipher.new(c)
decipher2 = OpenSSL::Cipher.new(c)
cipher2.encrypt
decipher2.decrypt
cipher2.key = key
cipher2.iv = iv
decipher2.key = key
decipher2.iv = iv

e = cipher2.update(data2)+ cipher2.final
p e

plain = decipher2.update(e) + decipher2.final
p plain
