# Ruby program to accept a filename from the user print the extension of that.
# Sample Output:
# 
# File name: test.rb
# Base name: test
# Extension: .rb
# Path name: /user/system

# do something with the file TODO

regex = /(\/?.+\/)     # path name

        (.+)          # base name
        \.            # .
        (\w+)        # extension
        /x

puts "enter filename"
filename = gets.chomp
# filename = "/user/system/test.rb"
filename.match(regex)
puts %{

File name: #{filename}
Base name: #{$2}
Extension: #{$3}
Path name: #{$1}
}

