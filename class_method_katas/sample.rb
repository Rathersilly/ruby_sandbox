#filename = ARGV[0]
require 'pathname'

dir = Pathname(Dir.pwd)
txts = dir.children.select { |x| x.extname == ".txt" }
file = txts.sample
puts file.basename.sub(/\..*/, "")
File.open(file) { |f| puts f.read.split.sample }
