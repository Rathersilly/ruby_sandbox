require 'fileutils'
require 'pry'

$stdout.reopen("/dev/null", "w") if ARGV[0] == '-v'
mediadir = Pathname.new(Dir.pwd)
band = 'Neural_Mammoth_Motivator'
bandphoto = 'mmg_band_photo.png'
album = 'Prime'
albumphoto = 'mmg_prime_album_art.png'

# Make band dir if it doesnt exist and copy band photo there
banddir = mediadir.join(band)
if !Dir.exist?(banddir)
  Dir.mkdir(banddir)
  puts "created #{banddir}"
else
  puts "dir #{banddir} exists"
end
FileUtils.cp(bandphoto, banddir)
puts "copied #{bandphoto} to dir #{banddir}"

Dir.chdir(banddir)

# Create album directory
# Put band image in directory
albumdir = banddir.join(album)

if !Dir.exist?(albumdir)
  Dir.mkdir(albumdir)
  puts "created directory: #{albumdir}"
else
  puts "dir #{albumdir} exists"
end

Dir.chdir(albumdir)

FileUtils.cp(mediadir.join(albumphoto), albumphoto)
puts "copied #{mediadir}/#{albumphoto} to #{albumdir}/#{albumphoto}"

# Create more fake albums
(1..5).each do |n|
  Dir.chdir(banddir)
  albumdir = banddir.join("album#{n}")
  puts "----"
  puts albumdir
  if !Dir.exist?(albumdir)
    Dir.mkdir(albumdir)
    Dir.chdir(albumdir)
    
    puts "created directory: #{albumdir}"
    
    # Copy image files to album directory
    fpath = mediadir.join("#{n}.png")
    FileUtils.cp(fpath, Dir.pwd)
    puts "copied #{fpath} to #{Dir.pwd}"

    # Create fake song files
    (1..5).each do |i|

      songname = "song#{i}.fake"
      FileUtils.touch(songname)
      puts "created #{songname} in #{Dir.pwd}"
    end
  else
    puts "dir #{albumdir} exists"
  end
end
