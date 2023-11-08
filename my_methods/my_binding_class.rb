define_method(:mybin) do 

  bin = Mybin.new
  self.local_variables.each do |var|
    bin.vars[var] = eval(var.to_s)
  end
  bin
end
class Mybin
  attr_accessor :vars
  def initialize
    @vars = {}
  end
  def lv                #localvariables (i'm lazy)
    @vars.keys
  end
  def lv_set(sym,obj)
    @vars[sym] = obj
  end
  def lv_get(sym)
    @vars[sym]
  end
end

a= 1
b = 4
c = 8
bin = mybin
p bin.vars
p bin.lv
bin.lv_set(:b,"hi")
p bin.vars
p bin.lv_get(:b)



