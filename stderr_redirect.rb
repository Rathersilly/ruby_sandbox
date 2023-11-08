# redirect $stderr to file
begin
  real_stderr = $stderr
  $stderr = File.open('log', 'a')
  E = $stderr
  E.puts 'hihihi'
ensure
  $stderr.close
  $stderr = real_stderr
end

# also this is neat:
# https://stackoverflow.com/questions/4459330/how-do-i-temporarily-redirect-stderr-in-ruby

def silence_streams(*streams)
  # on_hold = streams.collect { |stream| stream.dup }
  on_hold = streams.collect(&:dup)
  streams.each do |stream|
    stream.reopen(RUBY_PLATFORM =~ /mswin/ ? 'NUL:' : '/dev/null')
    stream.sync = true
  end
  yield
ensure
  streams.each_with_index do |stream, i|
    stream.reopen(on_hold[i])
  end
end

# Usage:
# silence_streams(STDERR) { do_something }
