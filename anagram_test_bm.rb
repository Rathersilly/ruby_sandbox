require 'benchmark'
# possible anagram solutions:
# sort letters into 2 arrays, compare arrays
# go through s1 letter by letter, if let is in s2, remove cosmonaut
#
# SPOLIER ALERT testing strings with include then reducing strings
# with sub! worked pretty fast should test big O though
class String
  #uh this one is totally wrong what was i thinking
  def my_include?(s)
    self.each_char do |c1|
      s.each_char do |c2|
        return true if c1 == c2
      end
    end
    return false
  end
  # this is ok but not as fast as ruby method
  # should sort first?
  def my_include2?(c)
    i = 0
    while i < size
      return true if self[i] == c
      i += 1
    end
  end
  # this method creates an array - not fast but is readable
  def my_include3?(c)

    self.each_char { |c1| return true if c == c1 }
  end
end

def ana_test_array_sort(s1, s2)

  s1 = s1.split('').sort
  s2 = s2.split('').sort
  s1 == s2
end
# this is WAY faster
def ana_test_include_sub(s1, s2)
  s1.each_char do |c|
    if s2.include?(c)
      s1.sub!(c, '')
      s2.sub!(c, '')
    end
  end
  return true if s1 == s2 && s1 ==  ''
  return false
end
# my_include is not as fast, probably because it's ruby
def ana_test_my_include_sub(s1, s2)
  s1.each_char do |c|
    if s2.my_include?(c)
      s1.sub!(c, '')
      s2.sub!(c, '')
    end
  end
  return true if s1 == s2 && s1 ==  ''
  return false
end
def ana_test_my_include2_sub(s1, s2)
  s1.each_char do |c|
    if s2.my_include2?(c)
      s1.sub!(c, '')
      s2.sub!(c, '')
    end
  end
  return true if s1 == s2 && s1 ==  ''
  return false
end
def ana_test_my_include3_sub(s1, s2)
  s1.each_char do |c|
    if s2.my_include3?(c)
      s1.sub!(c, '')
      s2.sub!(c, '')
    end
  end
  return true if s1 == s2 && s1 ==  ''
  return false
end

p ana_test_array_sort("astronomer", "moonstarer")
p ana_test_array_sort("cosmonaut", "moonstarer")
p ana_test_include_sub("astronomer", "moonstarer")
p ana_test_include_sub("cosmonaut", "moonstarer")

n = 500
Benchmark.bmbm do |test|
  test.report("ana_test_array_sort") do
    n.times do 
      ana_test_array_sort("astronomer", "moonstarer")
      ana_test_array_sort("cosmonaut", "moonstarer")
    end
  end
  test.report("ana_test_include_sub") do
    n.times do 
      ana_test_include_sub("astronomer", "moonstarer")
      ana_test_include_sub("cosmonaut", "moonstarer")
    end
  end
  test.report("ana_test_my_include_sub") do
    n.times do 
      ana_test_my_include_sub("astronomer", "moonstarer")
      ana_test_my_include_sub("cosmonaut", "moonstarer")
    end
  end
  test.report("ana_test_my_include2_sub") do
    n.times do 
      ana_test_my_include2_sub("astronomer", "moonstarer")
      ana_test_my_include2_sub("cosmonaut", "moonstarer")
    end
  end
  test.report("ana_test_my_include3_sub") do
    n.times do 
      ana_test_my_include3_sub("astronomer", "moonstarer")
      ana_test_my_include3_sub("cosmonaut", "moonstarer")
    end
  end
end



