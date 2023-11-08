require 'digest'

h = "e7ae6cfee91a324590df7b048dcc9802b7389c1b0d996d474d61c4cbb1253455"

pass = "lovelove"
h = Digest::SHA2.hexdigest(pass)

passwords = []
# File.open("some_rockyou_passwords.txt", chomp: true) do |f|
f = File.new("some_rockyou_passwords.txt", chomp: true)
passwords = f.readlines.map(&:chomp)

f.close
p passwords.length
p passwords[-1]
passwords.each do |pw|
  pw_hash = Digest::SHA2.hexdigest(pw)
    puts "Password is #{pw}, hash is #{pw_hash}"
  if (pw_hash == h)
    puts "FOUND"
    puts "Password is #{pw}, hash is #{h}"
    exit

  end
end
