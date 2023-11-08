require 'colorize'
# redoing vigenere cipher for practice
# note that using gsub! on a string arg will change the string
# outside - they are the same object
# can use dup or just dont use bang methods to iterate on string
#
#
# check out https://launchschool.com/blog/object-passing-in-ruby
module VigClean
  class << self
    def offset(c, i)
      memo = c.ord + i
      if memo > 122
        memo -= 26
      elsif memo < 97
        memo += 26
      end
      memo.chr
    end

    def vige(s, k)
      memo = ''
      i = 0
      # s.gsub(/\s/,'').each_char do |c|
      s.each_char do |c|
        next if c == ' '

        memo += offset(c, k[i].ord - 97)
        i += 1
        i = 0 if i >= k.size
      end
      memo
    end

    def vigd(s, k)
      memo = ''
      i = 0
      s.each_char do |c|
        memo += offset(c, -(k[i].ord - 97))
        i += 1
        i = 0 if i >= k.size
      end
      memo
    end

    def vig(s, k, arg)
      if arg[:hello] == :sup
      end
      if arg[:method] == :encrypt
        sign = 1
      elsif arg[:method] == :decrypt
        sign = -1
      else
        puts 'usage: vig(string, key, method)'
        puts "       method should be 'method: encrypt'"
        puts "       or 'method: decrypt'"
        return
      end
      memo = ''
      i = 0
      s.each_char do |c|
        next if c == ' '

        memo += offset(c, (k[i].ord - 97) * sign)
        i += 1
        i = 0 if i >= k.size
      end
      memo
    end
  end
end

p __FILE__
p $0
if __FILE__ == $0

  msg = 'aaaaaaaa'
  msg = 'zzzzzzzz'
  msg = 'why hello there whats going on'
  key = 'abc'
  key = 'supdawg'
  key = 'xyz'

  puts msg.object_id.to_s.blue
  puts msg
  cipher = VigClean.vige(msg, key)
  cipher = VigClean.vige(msg, key)
  puts msg.object_id.to_s.blue
  puts msg
  p cipher
  decoded = VigClean.vigd(cipher, key)

  p decoded

  msg = 'help im trapped in a computer'
  key = 'asdf'
  cipher = VigClean.vig(msg, key, method: :encrypt)
  puts msg
  decoded = VigClean.vig(cipher, key, method: :decrypt)
  p cipher
  p decoded
  p msg

  cipher = VigClean.vig(msg, key, method: :asdf, hello: :sup)
end
