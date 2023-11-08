# https://stackoverflow.com/questions/3226054/how-to-convert-a-ruby-object-to-json
require 'colorize'
class Person
  attr_accessor :name, :age, :likes

  def initialize(args)
    @name = args[:name] || args['name']
    @age = args[:age] || args['age']
    @likes = args[:likes] || args['likes']
  end

  def hi
    puts "Hi I'm #{@name}"
  end

  def as_json(_options = {})
    {
      name: @name,
      age: @age,
      likes: @likes
    }
  end

  def to_json(*_args)
    options = []
    as_json(*options).to_json(*options)
  end

  def to_yaml
    "name: #{name}
      age: #{age}"
  end

  def hash
    { name: @name, age: @age, likes: @likes }
  end
end
