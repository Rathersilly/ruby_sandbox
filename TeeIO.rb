# HOF candidate
# TODO: add dates to logs
# and make this a log example as well as Tee example
require 'logger'
class TeeIO < IO
  def initialize(orig, alt)
    @orig = orig
    @alt = alt
  end

  def write(str)
    @orig.write(str)
    @alt.write(str)
  end
end
myio = TeeIO.new($stdout, File.new('output.txt', 'a'))
myio.write 'hey there'
oldstdout = $stdout.dup
oldstdout.write 'hi from oldstdout'
$stdout = myio

log2 = Logger.new($stdout)

mylog = Logger.new(myio)
mylog.info('Logger lets you chose warning level')
mylog.info('like info')
mylog.warn('or warn')
mylog.debug('or debug')
begin
  raise
rescue RuntimeError => e
  puts 'hey'
  # puts e.message
  # p e
  # p e.backtrace
  mylog.warn('Error found')
end
