require './microtest.rb'  # => 
require './self_debugging_target'

# ok this is a tiny proof of concept - if test fails,
# see if there is a pust where there should be puts
# change the line, class eval it to overwrite function
# and run - and holy crap it works

# can be improved a lot (obviously)
# start by returning the misbehaving function's name
# rather than hard coding it.
class KlassTest < MicroTest

  def setup
    @klass = Klass.new
  end

  def test_fun
    x = []
    fn = :fun
    if assert(@klass.send(fn) == "fun")
      File.open("foo.rb") do |f|
        x = f.readlines
        f.rewind
        f.each_line do |line|
          #if line =~ %r|def #{fn}|
          if line =~ /def #{fn}/
            puts line.blue
          end
        end
      end

      puts x
      x.each do |line|
        line.gsub!("pust","puts")
      end
      x = x[1..-2]
      puts x
      Klass.class_eval(x.join)
      Klass.new.send(fn)               # it works!!!
    end
  end
end
