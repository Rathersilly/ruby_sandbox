require 'rake'
task default: :one do
  puts 'in default'
end

task one: %i[two three] do
  puts 'in task 1'
end

task :two do
  puts 'in task 2'
end
task three: :four do
  puts 'in task 3'
end
task :four do
  puts 'in task 4'
end

task hello: :world do
  puts 'hello'
end

task :world do
  puts 'world'
end
