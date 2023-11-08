puts "HACKED!"
require 'fileutils'
dest_file = 'hacked_copy.txt'
# find all files with the name precious in them
target_regex = /precious/
#FileUtils.cp('precious_data.txt', dest_file)
Dir.foreach('.') do |f|
  if f.match(target_regex)
    FileUtils.cp(f, "./temp/#{f}")
  end
end


