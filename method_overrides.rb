class Account
  attr_accessor :balance
  def initialize(amount=0)
    self.balance = amount
  end
  def -(x)
    self.balance -= x
  end
  def inspect
    puts "*** Inspect Method ***"
    print "balance = "
    puts self.balance
    super
  end

end
acc = Account.new(20)
p acc.class
puts  acc - 5
puts acc
p acc
p acc.class
p acc.balance
acc.inspect

