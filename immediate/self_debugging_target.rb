# this file has a line with a deliberate
# "pust" command.  self_debugging.rb will
# automatically correct it to puts.
class Klass
  def fun

    pust "hello from #{self}" rescue nil
    #pust "hello"
    return "fun"
  end
end
