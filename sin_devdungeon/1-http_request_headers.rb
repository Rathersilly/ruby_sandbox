# Inspecting http request headers
# from https://www.devdungeon.com/content/ruby-sinatra-tutorial
# tested with:
# curl http://localhost:4567/ -H "My-header: my data"

require 'sinatra'
require 'pp'

set :bind, '0.0.0.0'
set :port, 9999
get '/' do
  # the http request headers are stored as a Hash in the
  # request environment variable request.env
  puts 'Request headers:'
  puts request.env.class
  pp request.env
  'User agent: ' + request.env['HTTP_USER_AGENT']

  
end

