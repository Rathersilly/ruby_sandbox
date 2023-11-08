#!/usr/bin/ruby -w
# https://www.tutorialspoint.com/ruby/ruby_xml_xslt.htm

# ruby xml tutorial (using rexml)
require 'rexml/document'
require 'colorize'

include REXML

xmlfile = File.new('movies.xml')
xmldoc = Document.new(xmlfile)

# Now get the root element
root = xmldoc.root
puts 'Root element : ' + root.attributes['shelf']

# This will output all the movie titles.
xmldoc.elements.each('collection/movie') do |e|
  puts 'Movie Title : ' + e.attributes['title']
end

# This will output all the movie types.
xmldoc.elements.each('collection/movie/type') do |e|
  puts 'Movie Type : ' + e.text
end

# This will output all the movie description.
xmldoc.elements.each('collection/movie/description') do |e|
  puts 'Movie Description : ' + e.text
end
