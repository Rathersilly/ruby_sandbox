file = "bday_line.txt"

File.open(file) do |f|
  p f.find {|line| line =~ /class="bday">([\d-]*)</ }
  p $1
end

