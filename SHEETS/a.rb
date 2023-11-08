p ["ABC", "def", "Ghi", "jKL"].grep(/[a-z]\w\w/) { |x| x.upcase }
p ["ABC", "def", "Ghi", "jKL"].grep(/[a-z]\w\w/).map(&:upcase)

