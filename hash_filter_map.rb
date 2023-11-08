#
# HOP candidate
require 'colorize'

h = {}
i = 1
('a'..'z').each do |x|
  h[x.to_sym] = i
  i += 1
end
p h # {a:1,b:2....

# collect returns an array of the values returned by the block
h2 = h.collect { |_k, v| v.even? }              # [false, true, false, true...
p h2
h3 = h.collect { |k, v| k if v.even? }          # [nil,:b,nil,:d...
p h3
h4 = h.collect { |k, v| k if v.even? }.compact  # [:b,:d,:f...
p h4

# Hash#filter_map is #collect and #compact combined
h5 = h.filter_map { |k, v| k if v.even? }       # [:b,:d,:f...
p h5
