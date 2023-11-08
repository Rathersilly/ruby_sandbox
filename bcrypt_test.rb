require 'bcrypt'

pass = "asdf"
enc = BCrypt::Password.create(pass)
p enc

my_pass = BCrypt::Password.new(enc)
p my_pass
p my_pass.class
p my_pass == "asdf"
p my_pass == "sadfsadfds"
