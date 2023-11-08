require './microtest.rb'
require './self_debugging_target'

class KlassTest < MicroTest

  def setup
    @klass = Klass.new
  end

  def test_fun
    x = []
    if assert(@klass.fun == "fun")
      File.open("foo.rb") do |f|
        x = f.readlines
        f.rewind
        f.each_line do |line|
          if line =~ /def fun/
            puts line.blue
          end
        end
      end

      p x
      x.each do |line|
        line.gsub!("pust","puts")
      end
      x = x[1..-2]
      puts x
      Klass.class_eval(x.join)
      Klass.new.fun

    end



  end


end


# if test fails, find out what function failed
# find the function in the source code
# overwrite the function
