# WGR ch 14.3 - 14.4 - sneaking into scopes

puts 'hi'.tainted?
puts "system('rm *')".tainted?

class C
  def initialize(a = 'hi')
    @a = a
    # instance_variable_set(
  end

  def puts(x)
    Kernel.print 'printing from class C: '
    Kernel.puts x
  end
end
x = 'why hello there'
c = C.new
c.instance_eval { puts x }
C.class_eval do
  def puts(x)
    Kernel.puts x * 3
  end
end
c.puts 'hi'
p c.instance_variable_get('@a')
p c.instance_variable_set('@a', 'hello')
c.puts c.instance_variable_get('@a')
