require 'colorize'

# writing methods that look almost the same using Module#define_method
#
# can do something similar with method missing

class Post
  Statuses = %w[right left ok]
  class << self
    Statuses.each do |status|
      define_method "all_#{status}" do
        puts status.to_s.green
      end
    end
  end
  def self.method_missing(m)
    if m.match(/^all_(\w+)/)
      puts $1.yellow rescue puts "hmmm"
    elsif m.start_with?(/all_/)
      puts m.class   #symbol
      puts m.to_s.blue
    else
      puts "nope".red
    end
    puts "----"
    puts $&   # all_sdfasdjkflk - whole string
    puts $`   # post match
    puts $'   # pre-match
    puts $1   # sdfjkldjsfl - first capture group
    puts $2
  end
end
Post.hey

Post.all_right
Post.all_left
Post.all_asdfjlksdjfkls

Post.all_
Post.all_righty_then
