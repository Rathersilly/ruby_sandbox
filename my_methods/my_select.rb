module Enumerable
  def my_select1
    acc = []
    self.each do |x|
      acc << x if yield(x) == true
    end
    acc
  end
  def my_select2
    acc = []
    self.each { |x| acc << x if yield(x) == true }
    acc
  end
  def my_select3
    self.each_with_object([]) {|x, memo| memo << x if yield(x) == true }
  end
end
a = (1..10).to_a
b = a.my_select1 { |x| x.even? }
p b

b = a.my_select2 { |x| x.even? }
p b

b = a.my_select3 { |x| x.even? }
p b
