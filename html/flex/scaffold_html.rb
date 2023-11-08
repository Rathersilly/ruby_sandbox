# this directory is mostly doing odin project's flexbox
# tutorial, which links to Wes Bos's tutorial
#
# usage: in vim, type :r !ruby scaffold_html.rb
# to run this script and paste output in your buffer
#
puts "<html>"
puts "<head>"
puts "\t <title>Flexbox Practice</title>"
puts "<link rel=\"stylesheet\" href=\"aflex.css\">"
puts "</head>"
puts "<body>"
puts "<div class=\"container\">"
10.times do |n|
  puts "<div class=\"box box#{n+1}\">\n#{n+1}\n</div>\n\n"
end
puts "</div>"
puts "</body>"
puts "</html>"
