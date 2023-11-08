require 'faker'





band = "#{Faker::Creature::Animal.name} #{Faker::Hipster.word}"
band.capitalize!
p band
20.times do
  band = "#{Faker::Hacker.adjective} #{Faker::Verb.past} #{Faker::Creature::Animal.name}"
band.capitalize!
p band
end
p band
