# MRS. OVERDONE's lines are not counted because in D.P. she
# is called MISTRESS OVERDONE
# could fix this in future kata by making character class
# and have aliases - hard to do this automatically though

require 'open-uri'

page = 'http://www.gutenberg.org/cache/epub/1126/pg1126.txt'

# File.open("Measure_for_Measure.txt", "w") do |f|
#  f.write open(page).read
# end
file_name = 'Measure_for_Measure.txt'
def get_characters(file_name)
  chars = {}
  File.open(file_name, 'r') do |f|
    f.find { |line| line =~ /DRAMATIS/ }
    blank_lines = 0
    40.times do
      break if f.eof?

      line = f.readline

      blank_lines += 1 if line =~ /^\s*$/
      break if blank_lines > 1

      next unless line =~ /\s*([A-Z\s]+[A-Z])\b.*,\s*([a-z][a-zA-Z\s]*)$/

      chars[Regexp.last_match(1)] = Regexp.last_match(2).strip
      print Regexp.last_match(1), ' ', chars[Regexp.last_match(1)]
      puts
      blank_lines = 0
    end
  end
  chars
end

def count_all_lines(file_name)
  chars = get_characters(file_name)
  char_lines = Hash.new(0)
  File.open(file_name) do |f|
    f.find(/ACT I/)
    loop do
      line = f.readline
      break if f.eof? || line =~ /THE END/

      if line =~ (/\s*([A-Z\s]+)\..*/) && chars.keys.include?(Regexp.last_match(1))
        char_lines[Regexp.last_match(1)] += 1
      end
    end
  end
  char_lines
end

p get_characters(file_name)
p count_all_lines(file_name)
