require 'json'

h = {}
h['command'] = 'gcc'
h['hello'] = 'world'
a = [h]
puts JSON.generate(a)
puts JSON.pretty_generate(a)
