#!/usr/bin/env ruby

# TODO: this file currently sucks - what is def task doing here -
# need a separate file for rakefile basics and for options, tests, etc
# How to parse options in a rakefile

require 'optparse'
require 'colorize'
# TODO: set up namespace so you dont make methods that clash
# also need to make this work with system commands -
# or things other than puts
#
# TODO if two things depend on something, only run that thing once
#
# TODO tests!
# TODO namespaces/nested
# if no rakefile, go up directory paths, and pwd for rake is that directory
#
# command line options -P list all options
# descriptions
# -T show descriptions
# -W (task)where is this task defined
#

# METHOD 1 - OptionParser
options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: example.rb [options]'
  opts.on('-f', '--file RAKEFILE', 'Specify rakefile') do |rakefile|
    options[:rakefile] = rakefile
  end
end.parse!

rakefile = options[:rakefile] || 'myrakefile.rb'
puts "rakefile: #{rakefile}"
puts "args: #{ARGV}"

def task name = nil, **hash, &block
  hash.keys.each { |k| k.to_sym }
  method_name = (name || hash.keys.first).to_sym
  define_method(method_name) do
    puts "creating method: #{method_name}".light_blue
    hash.values.flatten.each do |v|
      send(v)
    end
    instance_exec(&block)
  end
end
load rakefile

if ARGV.empty?
  begin
    send(:default)
  rescue StandardError
    puts 'MyRake aborted!'
    puts 'No default task found'
  end
else
  ARGV.each do |arg|
    send(arg)
  end
end
