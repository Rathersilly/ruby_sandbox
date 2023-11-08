require 'nokogiri'
require 'open-uri'

# Scraping the list of methods from ruby-doc.org class pages

# target_page = 'https://ruby-doc.org/core-2.6.5/Array.html'
if ARGV[0]
  target_page == ARGV[0]
else
  target_page = '../Downloads/Ruby_arrays.html'
end

target_page = 'https://ruby-doc.org/core-2.6.5/String.html'
# Both work!
doc = Nokogiri::HTML(File.open(target_page))
# doc = Nokogiri::HTML(URI.open(target_page))

x_methods = []
doc.css('h1').each do |link|
  x_methods += link.content.split
end

xpath_string = "//div[contains(@id, 'method-list-section')]"
doc.xpath(xpath_string).each do |link|
  puts link.content
end

doc.css('div#method-list-section').each do |link|
  x_methods += link.content.split
end

output_file = "#{x_methods[0]}_#{x_methods[1]}.txt"
File.open(output_file, 'w') do |f|
  f.puts "#{x_methods[0]} #{x_methods[1]}.txt"
  (2..x_methods.size).each do |i|
    f.puts x_methods[i]
  end
end
