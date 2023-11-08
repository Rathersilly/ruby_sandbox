#remove the remove string from base string. not overlapping though, 
#so xxx - xx still leaves x
base = "Helxxxlxx thexxre"
remove = "xx"


loop do
  match = base.match(remove)
  break if match == nil
  #I KNOW THIS IS HORRIFYING
  #p match
  #p match[0]
  #p match.begin(0)
  #p match.length
  #puts "%%%%%%%%%%%%%%%"
  #p match.begin(0), match.end(0)
  if match
    base = base[0..match.begin(0)-1] + base[match.end(0)..-1]
  end
end
puts base

