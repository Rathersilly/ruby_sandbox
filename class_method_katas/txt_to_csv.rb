# filename = ARGV[0]
filename = 'Array_Methods.txt'
output = []
File.open(filename) do |f|
  output = f.read
end
output.gsub!("\n", ',').gsub!(/,,/, ',')
out_array = output.split(',')

# puts output
puts out_array.sample
