# Make a hash of files in directory where keys are extensions
# and values are the files with that extension
require 'awesome_print'
sorted_files = {}
Dir.each_child(Dir.pwd) do |f|
  ext = File.extname(f)
  if !ext.empty?
    ext = ext[1..-1]
    if sorted_files.has_key?(ext)
      sorted_files[ext] << f

    else
      sorted_files[ext] = [f]
    end
  end
end

sorted_files.each do |k,v|
  #v.sort!
  v.sort! do |a,b|
    a.downcase <=> b.downcase
  end
end
pp sorted_files
ap sorted_files
