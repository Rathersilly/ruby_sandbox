message = "we are transmitting from the year 1999."
message.each_char do |c|
  
  print c
  if c  =~ /\d/
    sleep 0.6
  else
    sleep 0.05
  end

end
puts
raise "hi"

