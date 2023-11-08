#Given a non-empty array, return true if there is a place
#to split the array so that the sum of the numbers on one
#side is equal to the sum of the numbers on the other side.
#
#canBalance([1, 1, 1, 2, 1]) → true
#canBalance([2, 1, 1, 2, 1]) → false
#canBalance([10, 10]) → true

def canBalance(array)
  sum1 = 0
  sum2 = 0
  array.length.times do |n|
    sum1 = array[0..n].inject(0) {|memo,i| memo + i}
    sum2 = array[n+1..-1].inject(0) {|memo,i| memo + i}

    if sum1 == sum2
      puts "#{array} can be balanced."
      puts "#{array[0..n]} and #{array[n+1..-1]} both sum to #{sum1}."
      return n
    end

  end
  puts "#{array} cannot be balanced."
end

canBalance([1, 1, 1, 2, 1])
canBalance([2, 1, 1, 2, 1])
canBalance([10, 10])
