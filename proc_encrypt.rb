# cipher program - encode each char with a different proc function
# which proc was used is stored in proc_keys
# but have to learn how to send argument to proc first
# could actually use this with existing hash fns
plaintext = 'abcwhy hello there here is some plain text'

encrypt_fns = []
decrypt_fns = []

a = (1..26).to_a
a.each do |i|
  r = rand(100)
  encrypt_fns << proc { |x| x * r }
  decrypt_fns << proc { |x| x / r }
end
proc_keys = (1..26).to_a.shuffle

ciphertext = []
plaintext.each_char do |c|
  ciphertext << c.ord % 97
end

p ciphertext
