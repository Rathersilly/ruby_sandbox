require 'yaml'
require './person_class'

fdata = File.read('people_data.yaml')
YAML.load_stream(fdata) do |item|
  p item
end
  
