# figuring out how before_save works
# can probably make callbacks for anything with method_missing
# TODO read more metaprogramming then attack this again
class ActiveRecord
  def self.before_save *methods
    methods.each do |m|
    end
    obv

    # instance_variable_set(:before_save, methods)
  end

  def save
    before_save
    puts 'saving!'
  end
end

class User < ActiveRecord
  before_save :foo

  def foo
    puts 'foo!'
  end
end

u = User.new
u.save
