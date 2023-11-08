# TLDR: don't use class accessors within class - just use @foo
#
# info: be careful about accidentally creating a local variable in a method.
# it won't actually represent the instance variable of the same name.
# as rule of thumb - dont trust attr_writer within the class itself.
require 'colorize'
class A
  attr_accessor :foo

  def initialize
    @foo = 0
  end

  def fun
    puts foo        # => 0
    @foo += 1
    puts foo        # => 1
    # foo += 1        # undefined method

    puts 'inside function'.blue
    puts 'foo and @foo refer to the same object'.green
    puts foo
    puts foo.class
    puts foo.object_id
    puts @foo
    puts @foo.class
    puts @foo.object_id
    puts '--------'.green
    foo = 'hi'
    puts 'foo is now a string'
    puts "foo: #{foo}, foo.class: #{foo.class}"
    puts "@foo: #{@foo}, @foo.class: #{@foo.class}"
  end
end

a = A.new
a.fun
puts 'outside function'.blue
a.foo = 7
a.fun
puts 'outside function'.blue

# works as expected
puts a.foo
a.foo += 1
puts a.foo

# a.instance_variables.each do |var|
#   #puts var
#   #puts a.instance_variable_get(var)
# end
#
# a.send(:initialize)
# a.fun
# a.fun
