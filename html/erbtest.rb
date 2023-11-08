require 'erb'
require 'yaml'

source = 'erbtest.html.erb'
doc = File.read(source)

colors = File.open('css_colors.yaml') do |f|
  YAML.load(f)
end
p colors
p colors.class


e = ERB.new(doc).result(binding)
File.open(source.sub('.erb',''),'w') do |f|
  f.write e
end




