#!/usr/bin/env ruby
# https://www.geeksforgeeks.org/awk-command-unixlinux-examples/
# example usage cat data/employees.txt | ./rawk.rb "/man/ {print $2,$3}
require 'colorize'


# nr = number of records
# nf = number of fields
# fs = field separator
# rs = record separator
# ofs = output field separator
# ors = output record separator
fs =/\s+/

input = STDIN.readlines

puts "input: #{input}"

arg = ARGV[0]
puts "arg: #{arg}"


# demo of named_captures
# match_string = arg.match(/\/(?<re>.*)\//).named_captures["re"]

re = Regexp.new(arg.match(/\/(?<re>.*)\//)[1])
puts "re: #{re}"
#cmd = Regexp.new(arg.match(/\{(.*)\}/)[1])
cmd = arg.match(/\{(.*)\}/)[1]
puts "cmd: #{cmd}"
p cmd.class
puts "-------".green
#pcmd = cmd.match(/print(?:\s*(\w+))/)
# puts "pcmd: #{pcmd}"
# p pcmd

data= []
input.each_with_index do |line, i|
  data[i] = []
  data[i][0] = line
  
  data[i] << line.split(fs)
  data[i].flatten!

end
p data
puts "-------".green


# go through cmd for each record- if you see $n replace it with field from input
# convert cmd to an array of individual thingies
# oh fk this is c++ calculator all over

cmd = cmd.gsub('print','').strip
cmd = cmd.split(/[,\s]+/)

p cmd
output = []
data.each_with_index do |line, i|
  line.grep(re) ? output << [] : next
  line.each_with_index do |field, j|
    p Regexp.quote(j.to_s)
    field_number = j - 1
    output << cmd.gsub(/\$#{Regexp.quote((j - 1).to_s)}/,field)
    output << cmd.gsub(/\$#{Regexp.quote((j - 1).to_s)}/,field)
    
  end
end
p output

