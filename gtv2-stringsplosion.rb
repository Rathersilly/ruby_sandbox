string = "code"

def stringsplosion(s)
  memo = ""
  s.length.times do |i|
    memo += s[0..i]
  end

  return memo


end

puts stringsplosion(string)
