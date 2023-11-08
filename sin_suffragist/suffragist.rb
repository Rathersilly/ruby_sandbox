#https://guides.railsgirls.com/sinatra-app
require 'sinatra'
require 'sinatra/reloader'
require 'yaml/store'

Choices = {
  'HAM' => 'Hamburger',
  'PIZ' => 'Pizza',
  'CUR' => 'Curry',
  'NOO' => 'Noodles',
}  

get '/' do
  @title = 'Welcome to the Suffragist!'
  erb :index
end


  @@totalvotes = 0
post '/cast' do
  @title = 'Thanks for casting your vote!'
  @vote = params['vote']
  @store = YAML::Store.new 'votes.yml'
  @store.transaction do
    @store['votes'] ||= {}
    @store['votes'][@vote] ||= 0
    @store['votes'][@vote] += 1
    
    File.open("log","w") do |f|
      f.write @store['votes']

      @store['votes'].each_value do |v|
        f.puts v
        @@totalvotes += v
      end
      f.write "total votes: #{@@totalvotes}"
    end



  end
  erb :cast
end

get '/results' do
  @title = 'Results so far:'
  @store = YAML::Store.new 'votes.yml'
  @votes = @store.transaction { @store['votes'] }
  erb :results
end



