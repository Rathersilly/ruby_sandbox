# some golf with a ruby codequiz problem - return arrag of average
# of each section of hash:
class_grades = {
  :section_one => [88, 74, 64],
  :section_two => [99, 100]
}
cg = class_grades


# the non golf way
avgs = []
class_grades.each do |k,v|
  avgs << v.inject {|sum,a| sum + a } / v.size
end
p avgs

# there is no Hash#each with object! so have to take k,v as x[0] and x[1]
#arr = class_grades.each_with_object([]) { |k,v, memo| p v}
arr = class_grades.each_with_object([]) { |x, memo| memo << (x[1].inject{|sum,a| sum + a }) / x[1].size}

p arr

arr = cg.to_a.map { |x| x[1].inject { |sum,a|sum + a }/x[1].size }

p cg.to_a.map! { |x| x[1].inject { |sum,a|sum + a }/x[1].size }
puts "sup"

# the golf version - not as readable though
p cg.to_a.map! { |x| x[1].sum / x[1].size }
