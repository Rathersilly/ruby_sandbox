# Array#my_unshift
# can't modify self, but can use replace method
# not sure of another way to do this really
class Array
  def my_unshift(x)
    # temp = [x] + self
    # self.replace(temp)
    # self.replace([x] + self)
    # self is implicit
    replace([x] + self)
    

  end
end
a = [2,3,4]
p a
a.unshift(1)
p a
a.my_unshift(0)
p a

