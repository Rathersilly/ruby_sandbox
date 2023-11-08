# copied from vigenere_final.rb

def offset(letter, n)
  letter = letter.ord + n           # .ord converts char to ascii
  letter -= 26 if letter.ord > 122  # 122 = 'z'.ord
  letter += 26 if letter.ord < 97   # 97 = 'a'.ord
  letter.chr                        # .chr converts char to ascii
end

def vig_encrypt(msg, key)
  # turn "abc" into [1,2,3]
  key = key.split('').map { |c| c.ord - 96 }

  # create an object(an enumerator) that will forever loop 1,2,3 by calling key.next
  key = key.cycle.to_enum

  # offset each char of the message an amount determined by calling key.next
  msg.chars.map { |c| offset(c, key.next) }.join
end

def vig_decrypt(msg, key)
  key = key.split('').map { |c| c.ord - 96 }
  key = key.cycle.to_enum
  msg.chars.map { |c| offset(c, -key.next) }.join
end

v = vig_encrypt('toerrishuman', 'abc')
p v
p vig_decrypt(v, 'abc')

v = vig_encrypt('helpimtrappedinacomputer', 'hello')
p v
p vig_decrypt(v, 'hello')
