# determine if each string in d can be found in order in the test string
d = %w[able ale apple bale kangaroo abpppleexyz abpee]
test_string = 'abppplee'

match_hash = { match: [], nomatch: [] }

d.each do |word|
  matchflag = false
  s = test_string
  print "Time for #{word}.\n"
  puts "\tMatches: "

  word.chars.each do |c|
    if s == ''
      puts 'Ran out of string.'
      matchflag = false
      match_hash[:nomatch] << word
      break
    end

    if s.include?(c)
      # if c is in s, s_memo is first location in s of c occuring
      # print "s.index(c): "
      # p s.index(c)
      # p s.slice(s.index(c),-1)
      matchflag = true
      print "\t#{c} \(#{s}\)\n"
      s = s[(s.index(c) + 1)..-1]
    else
      matchflag = false
      match_hash[:nomatch] << word
      break
    end
  end

  if matchflag == true
    match_hash[:match] << word
    puts "#{word} is a match!"
  end
end

p match_hash
match_hash.each do |k, v|
  print k, ': '
  print v.join(', ')
  puts
  puts
end

longest_match = match_hash[:match].select do |word|
  # gotta make sure the last thing in select block returns what you expect
  word.length == match_hash[:match].max_by(&:length).length
end
print 'Longest match: '
p longest_match
