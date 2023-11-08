# frozen_string_literal: true

# get the napoleon wikipedia page
# create character class
# populate class with birth, death, reigns, spouse,
# children, parents

# good practice to parse html, try nokogiri gem later though
# yeah lets not try to get spouses etc. seems nightmarish
require 'open-uri'

bone_site = 'https://en.wikipedia.org/wiki/Napoleon'
bone_file = 'napoleon_wiki.txt'

# File.open(bone_file, 'w') do |f|
#  f.write open(bone_site).read
# end

class Person
  attr_accessor :name, :bday

  def initialize(file)
    File.open(file) do |f|
      f.find { |line| line =~ /(DOC)/ }
      # try first bolded item for name?
      f.rewind
      f.find { |line| line =~ %r{<b>(.*?)</b>} }
      @name = ::Regexp.last_match(1)
      f.rewind
      f.find { |line| line =~ /class="bday">([\d-]*)</ }
      @bday = Regexp.last_match(1)
      f.rewind
    end
  end

  def summary
    puts "#{@name} was born on #{@bday}"
  end  # =>
end

bone = Person.new(bone_file)
bone.summary
