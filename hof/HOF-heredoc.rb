# https://docs.ruby-lang.org/en/master/syntax/literals_rdoc.html

# consider this first
string = 'line #1'\
         'line #2'\
         'line #3'

result = <<HEREDOC
  <<IDENTIFIER creates a heredoc
  which will take a string until
  IDENTIFIER is found again
HEREDOC
p result
result = <<-HEREDOC
  <<- will respect indent of the IDENTIFIER

  That might span many lines
HEREDOC
p result
result = <<~HEREDOC
  <<~ will ignore indents
HEREDOC
p result

expected_result = <<~EXPECTED.chomp
  One plus one is #{1 + 1}
EXPECTED

puts(<<~ONE, <<~TWO)
  content for heredoc one
ONE
  content for heredoc two
TWO
