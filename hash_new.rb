require 'yaml'

h = Hash.new {|hash,key| hash[key] = (key.ord)-96}
('a'..'z').each { |c| h[c] }
p h

# puts h.to_yaml

