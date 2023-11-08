# HOF candidate
# https://stackoverflow.com/questions/18289152/what-does-a-double-splat-operator-do
require 'colorize'

# a is required
#
# *b is optional - will sponge anything after a into an array,
# except key value pairs
#
# **c is optional - will sponge key-value pairs into a hash
def foo(a, *b, **c)
  puts "#{__method__} (a, *b, **c)".green
  p [a, b, c]
end

foo 10                          # [10, [], {}]
foo 10, 20, 30                  # [10, [20, 30], {}]
foo 10, 20, 30, d: 40, e: 50    # [10, [20, 30], {:d=>40, :e=>50}]
foo 10, d: 40, e: 50            # [10, [], {:d=>40, :e=>50}]
