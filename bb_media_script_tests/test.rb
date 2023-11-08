require 'fileutils'
require 'pathname'
mediadir = Pathname.new(Dir.pwd)
band = 'Neural_Mammoth_Motivator'
bandphoto = 'mmg_band_photo.png'
album = 'Prime'
albumphoto = 'mmg_prime_album_art.png'

new_album = "album1"
    Dir.mkdir(new_album)
    Dir.chdir(new_album)
    n = 1
#FileUtils.cp("#{mediadir}/#{n}.png}", Dir.pwd)
    puts Dir.pwd
    fname = "1.png"
    file = mediadir.join(fname)
    
FileUtils.cp(file, Dir.pwd)
