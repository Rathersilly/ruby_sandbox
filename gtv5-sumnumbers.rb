#Given a string, return the sum of the numbers
#appearing in the string, ignoring all other characters.

def sumNumbers(string)
  saved_string = string
  num_regex = /[\D|\b]*(\d+)[\D|\b]*/
  numbers = []
  loop do
    match = string.match(num_regex)
    break if match == nil
    numbers << match[1]
    #puts string
    string = string[match.end(1)..-1]
    #print "string: "
    #p string
    #p match
    #p match[0]
#
    #p match[1]
    #p match[2]
    #puts "--------------"
    #print "numbers array: "
    #p numbers
    #puts "++++++"

  end
  sum = numbers.inject(0) { |memo,i| memo + i.to_i}
  print "Sum of numbers in #{saved_string} is #{sum}.\n"


end





sumNumbers("abc123xyz")# → 123

sumNumbers("23aa11b33")# → 67
sumNumbers("7 11")# → 18
