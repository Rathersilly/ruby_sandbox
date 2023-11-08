# Ruby Error Handling
# rescue: usable inside methods and blocks (use begin/end if necessary)
require 'time'; require 'irb'

class MyException < RuntimeError; end # create your own exception
puts 'enter integer: '
n = gets.chomp; filename = 'somefile.txt'; logfile = $stdout

begin
  raise ArgumentError unless n =~ /\d+/

  n = n.to_i
  result = 100 / n
rescue StandardError => e
  logfile.puts("User tried to open #{filename}, #{Time.now}")
  logfile.puts("Exception: #{e.message}")
  binding.irb
  raise
rescue ZeroDivisionError
  puts 'Nope cant divide by 0'
  exit
rescue ArgumentError
  puts 'Arg Error sup'
  exit
else
  # executes when no error
ensure
  # will always run
end
puts "100/#{n} is #{result}."
