# Rake String/Array extensions for
# file name/list manipulation
require 'colorize'
require 'rake'

# String#ext
# returns the string with new extension, or no extension if ""
# def ext(newext="")

# String#pathmap - from rake_source/lib/rake/ext/string.rb

# def pathmap(spec = nil, &block)
#   return self if spec.nil?
#
#   result = ''.dup
#   spec.scan(/%\{[^}]*\}-?\d*[sdpfnxX%]|%-?\d+d|%.|[^%]+/) do |frag|
#     case frag
#     when '%f'
#       result << File.basename(self)
#     when '%n'
#       result << File.basename(self).ext
#     when '%d'
#       result << File.dirname(self)
#     when '%x'
#       result << File.extname(self)
#     when '%X'
#       result << ext
#     when '%p'
#       result << self
#     when '%s'
#       result << (File::ALT_SEPARATOR || File::SEPARATOR)
#     when '%-'
#       # do nothing
#     when '%%'
#       result << '%'
#     when /%(-?\d+)d/
#       result << pathmap_partial(Regexp.last_match(1).to_i)
#     when /^%\{([^}]*)\}(\d*[dpfnxX])/
#       patterns = Regexp.last_match(1)
#       operator = Regexp.last_match(2)
#       result << pathmap('%' + operator).pathmap_replace(patterns, &block)
#     when /^%/
#       raise ArgumentError, "Unknown pathmap specifier #{frag} in '#{spec}'"
#     else
#       result << frag
#     end
#   end
#   result
# end

# Rake::FileList is basically an array
# with helper methods including:

# perform action on each index
# def ext(newext="")
# def pathmap(spec=nil, &block)

sources = Rake::FileList['foo.cpp', 'goo.cpp', 'src/foo_src.cpp']
objects = sources.pathmap('obj/%X.o')

sources.each do |source|
  p source.class
end
objects.each.with_index do |objfile, i|
  srcfile = sources[i]
  rule objfile => srcfile do |t|
    puts 'IN RULE'.yellow
    p objfile
    p t
    sh "g++ -c #{srcfile}"
    sh "mkdir -p #{objfile.pathmap('%d')}"
    sh "mv #{objfile.pathmap('%f')} #{objfile}"
  end
end
task default: :binary

task binary: objects do
  sh "g++ #{objects}"
end
