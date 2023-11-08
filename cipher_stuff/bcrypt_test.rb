require 'bcrypt'
pass = BCrypt::Password.create('foobar')
p pass
p pass.class
p pass.class.instance_methods(false)
#p pass.is_password?
p pass.cost

p pass == "hi"
p pass == 'foobar'

  



