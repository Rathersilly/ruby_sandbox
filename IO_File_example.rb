# HOF candidate
# https://ruby-doc.org/core-2.7.0/IO.html
# https://thoughtbot.com/blog/io-in-ruby
# TODO finish this or merge it with another

# write to a file
fd = IO.sysopen('./b.txt', 'a+') # = 5 (on this machine)
f = IO.new(fd)
# IO#readline is the same as IO#gets, except it raises EOFError at EOF
begin
  p f.gets
  2.times { p f.readline }
rescue StandardError
  puts 'reached end of file with f.readline'
end
puts "f.pos: #{f.pos}"
f.write "hello there\nwhats up\n"
f.close

# write to a linux fd (/dev/tty represents the current console)
# /dev/null is bitbucket
ttyfd = IO.sysopen('/dev/tty', 'w') # = 6 (on this machine)
tty = IO.new(ttyfd)
tty.write "tty.write to stdout!\n"

io = IO.new(2) # IO::new(fd [, mode] [, opt]) → io
# 0 = stdin fd    - IO object is $stdin
# 1 = stdout fd   - IO object is $stdout
# 2 = stderr fd   - IO object is $stderr
io.write "io.write to stderr!\n"
io.puts 'hi again!'
io = IO.new($stderr)
io.write "io.write to stderr!\n"
io.puts 'hi again!'

randio = IO.new(IO.sysopen('/dev/random', 'r'))
puts "here's 10 items from /dev/random: #{randio.read(10)} "
print "here's 10 items from /dev/random (using p not puts): "
p randio.read(10)

### Subtypes and ducktypes
# File > IO - File doesn't require file descriptors
f = File.open('lorem.txt', 'r')
f.pos = 6
f.read(5)
f.rewind
p f.readline
f.close
# f = File.
