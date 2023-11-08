require 'colorize'
# Common exceptions ( from WGR 190 )
# Exception               How to raise
# RuntimeError            raise keyword
# NoMethodError           a.some_unknown_method_name
# NameError               a = some_random_identifier
# IOError                 $stdin.puts("Don't write to $stdin!")
# Errno::error            File.open(-12)
# TypeError               a = 3 + "hello"
# ArgumentError           def m(x);end; m(1,2,3)

class Cat
  def method_missing(thing)
    # File.open(thing.to_s + ".txt", "w") { |f| f.puts "hey there" }
    puts "I don't know how to #{thing}"
  end
end
class MyError < ZeroDivisionError
  def self.my_report
    puts "REPORTING FROM MyError".red
  end
end
$stderr.puts "hi from stderr"


i = 5
while 1
  begin
    i -= 1
    puts 5/i
  # error will be an instance of the class ZeroDivisionError
  rescue ZeroDivisionError => error
    puts "error.full_message: #{error.full_message}".yellow
    puts "error.backtrace: #{error.backtrace}"
    puts "error.backtrace_locations: #{error.backtrace_locations}"
    begin
      raise MyError
    rescue MyError => e
      puts "inspecting e"
      p e.inspect

      MyError.my_report
      puts "e.cause (ie previous error message): #{e.cause}"
      puts "rescuing Myerror and leaving loop"
      break
    rescue NameError
      puts "this won't run because there's no name error here"
    else
      puts "this will print if there's no error"
    ensure
      puts "this is ensured"
    end
  end
end

cat = Cat.new
# won't raise NoMethodError because Cat has a method_missing method
cat.bark
