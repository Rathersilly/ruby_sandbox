
def read_names(filename = 'members.txt')
  @members = File.open(filename) { |f| f.read.split("\n") }
end

def write_names(names, filename = 'test.txt')
  File.open(filename, 'w') { |f| f.write(names.join("\n")) }
end
names = read_names
p names
names.reject!{|name| name == 'bob'}
write_names(names)
names = read_names('test.txt')
