require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'yaml'
require 'pry'

# This file does the following:
# * open w3schools css colors page
# * parse the file with nokogiri to find color names and hex
# * store those in a hash, write hash to yaml file

# populate array from https://www.w3schools.com/cssref/css_colors.asp
# get the names that are in <a> within
# a span with class="colornamespan"
colorfile = 'https://www.w3schools.com/cssref/css_colors.asp'

# dont need to visit page every time
# colordoc = Nokogiri::HTML(URI.open(colorfile))
# File.open("css_colors.asp","w") { |f| f.write colordoc }

puts "Getting a Nokogiri::HTML::Document".green
# i think these are the same
colordoc = Nokogiri::HTML(File.open("css_colors.asp"))
colordoc2 = File.open("css_colors.asp") do |f|
  Nokogiri::HTML(f)
end
puts (colordoc == colordoc2).to_s.magenta
#p colordoc.xpath('//span')
pp colordoc2.class
                      
puts colordoc.class

colors = {}
puts "getting a  Nokogiri::XML::Nodeset object, which is \
a container for Nokogiri::XML::Element objects".green
puts " colordoc.css('.colorbox') ".center(50,'*').light_blue
puts colordoc.css('.colorbox').class.to_s.cyan
puts ("*" * 50).light_blue
puts "colordoc.css('.colorbox')[0] ".center(50,'*').light_blue
puts colordoc.css('.colorbox')[0].class.to_s.cyan
puts colordoc.css('.colorbox')[0]
puts ("*" * 50).light_blue

puts "colordoc.css('.colorbox')[0].css('.colornamespan a') ".center(50,'*').light_blue
puts colordoc.css('.colorbox')[0].css('.colornamespan a').class.to_s.cyan
puts colordoc.css('.colorbox')[0].css('.colornamespan a')
puts ("*" * 50).light_blue
puts "colordoc.css('.colorbox')[0].css('.colornamespan a').text ".center(50,'*').light_blue
puts colordoc.css('.colorbox')[0].css('.colornamespan a').text.class.to_s.cyan
puts colordoc.css('.colorbox')[0].css('.colornamespan a').text
puts ("*" * 50).light_blue

colordoc.css('.colorbox').each do |link|
  # these are Nokogiri::XML::Element objects
  colorname = link.css('.colornamespan a').text
  colorhex = link.css('.colorhexspan a').text
  colors[colorname] = colorhex
  
  
end
#p colors
yamlfile = 'css_colors.yaml'
puts "Outputting colors hash to #{yamlfile}".green
File.open(yamlfile,'w') { |f| YAML.dump(colors,f) }

# reading yaml for edification
colors_from_yaml = YAML.load(File.read(yamlfile))
p colors_from_yaml[0..20]


#f = File.read 'erbtest.html.erb'

