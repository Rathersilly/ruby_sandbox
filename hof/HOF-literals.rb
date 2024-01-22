# https://docs.ruby-lang.org/en/master/syntax/literals_rdoc.html

# Percent Literals - use with just about any delimiters: () [] || aa etc.
# Capital letters are Non-Interpolable

# String  Literals (%q is interpolable, %Q  and % are not)
p %[foo bar baz]          # => "foo bar baz" # Using [].
p %q(1 + 1 is #{1 + 1})   # => "1 + 1 is \#{1 + 1}" # Iinterpolation.
p %(1 + 1 is #{1 + 1})    # => "1 + 1 is \#{1 + 1}" # No interpolation.
p %Q(1 + 1 is #{1 + 1})   # => "1 + 1 is \#{1 + 1}" # No interpolation.


# String Array Literals (%w is interpolable, %W is not)
# Use backslash to embed spaces in the strings.
p %w[foo bar baz]       # => ["foo", "bar", "baz"]
p %w[1 % *]             # => ["1", "%", "*"]
p %w[foo\ bar baz\ bat] # => ["foo bar", "baz bat"]
p %w(#{1 + 1})          # => ["\#{1", "+", "1}"]
p %W(#{1 + 1})          # => ["2"]


# Symbol Array Literals
# Use backslash to embed spaces in the symbols.
p %i[foo bar baz]       # => [:foo, :bar, :baz]
p %i[1 % *]             # => [:"1", :%, :*]
p %i[foo\ bar baz\ bat] # => [:"foo bar", :"baz bat"]
p %i(#{1 + 1})          # => [:"\#{1", :+, :"1}"]
p %I(#{1 + 1})          # => [:"2"]

# Symbol Literals
p %s[foo]     # => :foo
p %s[foo bar] # => :"foo bar"%s[foo]     # => :foo
p %s[foo bar] # => :"foo bar"%s[foo]     # => :foo %s[foo bar] # => :"foo bar"

# Regex Literals
p %r/foo/             # => /foo/
p %r:name/value pair: # => /name\/value pair/

# Backtick Literals (shell commands)
p %x(echo 1) # => "1\n"

