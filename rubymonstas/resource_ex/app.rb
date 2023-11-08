# frozen_string_literal: true  # => 

###########################################################
# Rubymonstas Sinatra resource exercise
# http://webapps-for-beginners.rubymonstas.org/exercises/sinatra_resource.html
###########################################################
require 'sinatra'
require 'sinatra/reloader'
require './user.rb'
require 'erb'

enable :sessions

get '/' do
  redirect '/members'
end

get '/members' do
  # return list of members names, which are in members.txt
  # erb template is index.erb
  # each of these members names is a link to /members/:name
  @title = 'These people are members:'
  @members =read_names 
  @members = [] if @members.nil?
  @message = session.delete(:message)
  erb :index
end

get '/members/new' do
  @message = session.delete(:message)
  erb :new
end
post '/members' do
  @name = params[:name]
  if valid?(@name)
    File.open('members.txt', 'a') { |f| f.write("\n#{@name}") }
    session[:message] = "Added #{@name}"
    redirect "/members/#{@name}"
  else
    @message = "couldn't add \"#{@name}\""
    erb :new

  end
end
get '/members/:name' do
  # views/show.erb
  @members = read_names
  @name = params[:name]
  @title = "Member page for #{@name}"
  @message = session.delete(:message)
  @message = "#{@name} is not a member." if @members.include?(@name) == false
  # display a details page for this member
  # and a link "all members" that goes to /members
  # erb template is show.erb
  erb :show
end
get '/members/:name/edit' do
  @name = params[:name]
  @title = "Editing #{@name}"
  erb :edit
end
# IMPORTANT - remember about faking http verbs - this should
# be a faked PUT verb
put '/members/:name' do
  @name = params[:name]
  session[:message] = 'we just put something' if valid?(@name) == false
  redirect "/members/#{@name}"
end
get '/members/:name/delete' do
  @name = params[:name]
  @title = "delete member: #{@name}?"
  erb :delete
end
delete '/members/:name' do
  # remove name from file
  @name = params[:name]
  @names = read_names
  @names.reject! { |i| i == @name }
  write_names(@names)
  session[:message] = "deleted #{@name}"

  redirect '/members'
end
def read_names(filename = 'members.txt')
  @members = File.open(filename) { |f| f.read.split("\n") }
end

def write_names(names, filename = 'members.txt')
  File.open(filename, 'w') { |f| f.write(names.join("\n")) }
end

def valid?(name)
  # returns true if name is not already in members.txt
  # and name is not empty
  if name.is_a?(String) && name.empty? == false
    @members = File.read('members.txt').split("\n")
    return true if @members.include?(name) == false
  end
  false
end
