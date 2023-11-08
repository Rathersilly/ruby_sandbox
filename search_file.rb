# frozen_string_literal: true

#file = 'processes.txt'  # => "processes.txt"
file = 'htmlsample.txt'

File.open(file) do |f|                    # => File
  f.find { |line| line =~ /<b>(.*)<\\b>/ }  # => "   10 ?        00:00:00 migration/0\n"
  p Regexp.last_match
  line = f.readline                       # => "   11 ?        00:00:00 watchdog/0\n"
  p line                                  # => "   11 ?        00:00:00 watchdog/0\n"
  p f.pos                                 # => 335
  p f.lineno                              # => 10
end                                       # => 10

# >> #<MatchData "migration" 1:"migration">
# >> "   11 ?        00:00:00 watchdog/0\n"
# >> 335
# >> 10
