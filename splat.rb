# HOF candidate
require 'colorize'
def splat_at_end(a, *b) # splat will sponge up any number of arguments afer required arguemnts
  # and store the in the array b
  puts "#{__method__} (a, *b)".green
  p a
  p b
end

a = [1, 2, 3]

splat_at_end 1, 2, 3    # b = [2,3]
splat_at_end 1          # b = []

def splat_in_middle(a, *b, c)
  puts "#{__method__} (a, *b, c)".green
  p a
  p b
  p c
end

p
splat_in_middle(1, 2, 3, 4)
splat_in_middle(1, 2)
begin
  puts 'attempting to call splat_in_middle(a,*b,c) with 1 argument'.green
  splat_in_middle(1)
rescue ArgumentError => e
  puts 'rescuing ArgumentError'
  p e
  p e.class
ensure
  puts 'Goodbye!'
end
