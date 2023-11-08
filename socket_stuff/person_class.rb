require 'yaml'

class Person
  attr_accessor :name,:age,:info 

  def initialize(args)
    @name = args[:name]
    @age = args[:age]
    @info = args[:info]
  end
  def to_yaml
    "name: #{name}
      age: #{age}"
  end
  def hash
    {name: @name, age: @age, info: @info}
  end
end

# seed data into file if this file is run
if __FILE__ == $0
  alice = Person.new(name: "alice",
                   age: 100,
                   info: { hobby: "spelunking",
                           dream: "to not die"})
  bob = Person.new(name: "bob",
                   age: 69,
                   info: { hobby: "snorkeling",
                           dream: "have a pet giraffe"})
  carlos = Person.new(name: "carlos",
                   age: 9001,
                   info: { hobby: "pumping iron",
                           dream: "visit mars"})
  people = []
  people << alice << bob << carlos
  File.open("people_data.yaml", "w") do |f|
    people.each do |person|
      f.write(YAML.dump(person))
    end
  end

end
