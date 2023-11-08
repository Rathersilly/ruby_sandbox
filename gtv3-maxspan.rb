test_array = [1, 4, 2, 1, 2, 4, 1, 4]
#test_array.map { |i| i.to_s }
#10.times { array << rand(0..9) }

def spans(array)
  #use -1 to search from end of array
  span_hash = {}
  array.each_with_index do |v, i|
    #search from end of string until you find another v
    #the span of that is i to the index of that other v
    #if the indexes are the same, span is 0
    next if span_hash.has_key?(v)

    print "---------------\n"
    print v, " - ",i, "\n"
    print "---------------\n"
    l = array.length
    l.times do |j|
      pos = l-1-j
      print "i: #{i}   pos #{pos}, j #{j}\n"
      if v == array[pos]
        puts "match"
        span = pos-i
        puts "span: #{span}"
        span_hash[v] = span
        break
      end

    end

    #array[i..-1]
  end

  print "Hash of spans: "
  p span_hash
end

def max_span(span_hash)
  #need to find max value and which keys have that value
  max_hash = {}
  span_hash.each do |k,v|
    if v == span_hash.values.max
      max_hash[k] = v
    end
  end

  puts "These numbers have the largest span, which is #{max_hash.values.max}" 
  max_hash.each do |k,v|
    puts k
  end


end

#spans(test_array)
max_span(spans(test_array))
#puts max_span(test_array)
