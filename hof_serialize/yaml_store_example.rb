require 'yaml/store'
require 'colorize'
people = { 'alice' => { pets: %w[aardvark alligator], job: 'astronaut' }, 'bob' => { pet: 'bat', job: 'baker' } }

store = YAML::Store.new 'y.yml'

puts 'p people:'.green
p people

store.transaction do
  store[:people] = people
  store[:people]['alice'][:pets] << 'anteater'
  store[:people]['alice'][:pets].delete('alligator')

  # store["alice"][:pets] << "anteater"
end
puts 'people.to_yaml: '.green
puts people.to_yaml

puts 'YAML.dump(people)'.green
puts YAML.dump(people)

File.open('ppl.yml', 'w') do |f|
  f.write people.to_yaml
end

loaded_hash = YAML.load(File.read('ppl.yml'))
puts 'loaded_hash:'.green
p loaded_hash

loaded_people = YAML.load(File.read('y.yml'))[:people]
p loaded_people
