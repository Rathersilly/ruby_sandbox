puts "this is the first(master)program file"
load "loadee.rb"
puts "and back again to the first file"
require "./loadee2.rb"
puts "and back again to the first file2"

load "loadee.rb"
puts "and back again to the first file3"
require "./loadee2.rb"
puts "and back again to the first file4"
