require 'sinatra'

# :x is required for matching
# Try /x/testing
# Will not match /x because no trailin slash provided
# Will not match /x/ because :x param is missing
get '/x/:x' do
  "x is #{params['x']}"
end

