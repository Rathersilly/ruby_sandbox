require 'colorize'

# template engine
# https://bits.theorem.co/how-to-write-a-template-library/

filename = 'template_sample.html.rtp'
outfilename = 'template_output.html'
access = 1
data = [1,2,3]

# Note: #{x} will produce x.to_s
# so can input array as code no problem
func = "Proc.new do\nresult = ''\n"
func << "access = #{access}\n"
func << "data = #{data}\n"
File.open(filename) do |f|
  f.each_line do |line|
    if line =~ /^\s*%/
      func << "#{line.sub(/%/,'')}"

    elsif line =~ /({{(.*)}})/
      code = "\#\{#{$2}\}"
      func << %Q|result << "#{line.sub!($1,code)}"\n|
    else
      func << %Q|result << "#{line}"\n|
    end
  end
  func << "result\n"
  func << "end\n"
  #eval(func)
end
puts func
puts "*******".green
output = eval(func).call
puts output
File.open(outfilename, "w") do |f|
  f.puts output
end

