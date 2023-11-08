require 'colorize'

class Test

  def self.inherited(subclass)
    puts "#{subclass} created from #{self.class}"
    subclass.class_eval do
      def self.method_added(m)
        c = self.new
        if m =~ /^test_(.*)/
          if c.methods.include?(:setup)
            puts "testing #{$1}"
            c.send(:setup)
          end
          c.send(m)
          puts
        end
      end
    end
  end
  def assert(assertion)
    if assertion
      puts "assertion passed!".green
      puts
      true
    else
      #if not caller[1] =~ /method_added/
        puts "---------".red
        puts caller[1]
        puts "assertion failed!".red
        puts "---------".red
        puts
      #end
      false
    end
  end
  def assert_equal(a,b)
    if assert(a==b)
      puts "#{a} == #{b}: assertion passed!".green
      true
      puts
    else
      puts "---------".red
      puts "#{a} != #{b}: assertion failed!".red
      puts "---------".red
      puts
      false
    end
  end
  def get_method(file,method)
    lines = []
    File.open(file) do |f|
      puts "hi"
      lines = f.readlines
    end
    fun = ""
    infun = false
    lines.each do |line|
      if line =~ /def #{method}/
        infun = true
      end
      if infun == true
        line.sub!(/-/,'+')
        fun += line
        break if line =~ /end/
      end
    end
    puts "hi".blue

    fun
  end
  def check_sign
    # change sign from - to + and see if test passes
    # add this function to array of functions!

  end

end



class SubTest < Test
  def setup
    puts "setup"
  end

  def test_jkl
    puts "testing"
  end
end


f = Test.new
