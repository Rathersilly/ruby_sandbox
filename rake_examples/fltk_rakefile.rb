# TODO - get this wroking!
#
CC = L
task :default do
  sh 'g++ foo.cpp'
end

# from command line : $ rake fltk[3, "hello"]
task :fltk, [:fname] do |t, args|

  source_files = Rake::FileList('foo.cpp')
  object_files = source_files.ext('.o')
  ldflags = '-L/usr/local/lib -lfltk -lXext -lX11 -lm -lfltk_images'
  cflags = '-g -ggdb -Wall -std=c++17'
  p t
  p args
  p args[:fname]
  sh "#{CXX} g++ `fltk-config --cxxflags` #{cflags} #{ldflags} #{args[:fname]}"
end

CXX      = $(shell fltk-config --cxx)
DEBUG    = -g
# CXXFLAGS = $(shell fltk-config --use-gl --use-images --cxxflags ) -I.
CXXFLAGS = $(shell fltk-config --use-gl --use-images --cxxflags )
LDFLAGS  = $(shell fltk-config --use-gl --use-images --ldflags )
LDSTATIC = $(shell fltk-config --use-gl --use-images --ldstaticflags )
LINK     = $(CXX)
task :argtest, [:a] do |_t, args|
  p args
end
