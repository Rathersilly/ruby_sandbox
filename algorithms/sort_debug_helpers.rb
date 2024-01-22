require 'colorize'
DEBUG = false
DEBUG = true

if DEBUG
  define_method(:print_locals) do |b|
    print 'Locals: '.bold.cyan
    b.local_variables.each do |var|
      print "#{var}: #{b.local_variable_get(var)} | ".light_cyan
    end
    puts
  end
else
  define_method(:print_locals) do |*_args|
  end
end

class String
  def col(n)
    width = 4
    ' ' * n * width + self
  end
end

class Debug
  def self.locals(b)
    str = ''
    str << 'Locals: '
    b.local_variables.each do |var|
      str << "#{var}: #{b.local_variable_get(var)} | "
    end
    DEBUG ? str : ''
  end
end
