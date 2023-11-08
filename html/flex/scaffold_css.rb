# usage: in vim, type :r !ruby scaffold_html.rb
# to run this script and paste output in your buffer
colors = %w[red orange yellow green blue
indigo violet tomato firebrick fuchsia]
puts ".box {
    height: 100px;
    width: 100px;
    font-size: 1.5em;
    color: white;
  }"
10.times do |n|
  puts ".box#{n+1} {
  background: #{colors[n]};
  }"
end
  
