# HOF candidate
# https://docs.ruby-lang.org/en/master/syntax/literals_rdoc.html

# NOTE: - any char can be used to delimit a % string - various brackets
# are most common

# TLDR:
# capital letter = interpolatble
# lowercase letter = non-interpolatble
# %q = String
# %w = array
# %i = Sybol Array
#
# these are less commonkey: value
# %s Symbol
# %r Regexp
# %x Shell command
#
# percent strings are useful as a shortcut and also whe you would have to escape many characters
<<~ASDF
  Copy pasted from # https://docs.ruby-lang.org/en/master/syntax/literals_rdoc.html
    # %q: Non-Interpolable String Literals
        %[foo bar baz]        # => "foo bar baz" # Using [].
        %(foo bar baz)        # => "foo bar baz" # Using ().
        %{foo bar baz}        # => "foo bar baz" # Using {}.
        %<foo bar baz>        # => "foo bar baz" # Using <>.
        %|foo bar baz|        # => "foo bar baz" # Using two |.
        %:foo bar baz:        # => "foo bar baz" # Using two :.
        %q(1 + 1 is #{1 + 1}) # => "1 + 1 is \#{1 + 1}" # No interpolation.
      % and %Q: Interpolable String Literals

      You can write an interpolable string with %Q or with its alias %:

      %[foo bar baz]       # => "foo bar baz"
      %(1 + 1 is #{1 + 1}) # => "1 + 1 is 2" # Interpolation.

      %w and %W: String-Array Literals

      You can write an array of strings with %w (non-interpolable) or %W (interpolable):

      %w[foo bar baz]       # => ["foo", "bar", "baz"]
      %w[1 % *]             # => ["1", "%", "*"]
      # Use backslash to embed spaces in the strings.
      %w[foo\ bar baz\ bat] # => ["foo bar", "baz bat"]
      %w(#{1 + 1})          # => ["\#{1", "+", "1}"]
      %W(#{1 + 1})          # => ["2"]

      %i and %I: Symbol-Array Literals

      You can write an array of symbols with %i (non-interpolable) or %I (interpolable):

      %i[foo bar baz]       # => [:foo, :bar, :baz]
      %i[1 % *]             # => [:"1", :%, :*]
      # Use backslash to embed spaces in the symbols.
      %i[foo\ bar baz\ bat] # => [:"foo bar", :"baz bat"]
      %i(#{1 + 1})          # => [:"\#{1", :+, :"1}"]
      %I(#{1 + 1})          # => [:"2"]

      %s: Symbol Literals

      You can write a symbol with %s:

      %s[foo]     # => :foo
      %s[foo bar] # => :"foo bar"

      %r: Regexp Literals

      You can write a regular expression with %r; the character used as the leading and trailing delimiter may be (almost) any character:

      %r/foo/             # => /foo/
      %r:name/value pair: # => /name\/value pair/

      A few “symmetrical” character pairs may be used as delimiters:

      %r[foo] # => /foo/
      %r{foo} # => /foo/
      %r(foo) # => /foo/
      %r<foo> # => /foo/

      The trailing delimiter may be followed by one or more modifier characters that set modes for the regexp. See Regexp modes for details.
      %x: Backtick Literals

      You can write and execute a shell command with %x:

      %x(echo 1) # => "1\n"

ASDF
