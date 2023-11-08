#!/usr/bin/env ruby
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  opts.on("-f", "--file RAKEFILE", "Specify rakefile") do |file|
    options[:file] = file
  end
  opts.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
    p list
    options.list = list
  end
end.parse!

p options
p ARGV
