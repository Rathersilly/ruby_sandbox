# using this blog post as reference
#
# https://medium.com/@rileythompson/setting-up-a-simple-sinatra-blog-app-db56dda4c280
#
# to run:
# bundle exec rackup
# alias be rackup

puts "it worked".green


get '/' do
  erb :index
end

get '/sup' do
  'sup'
end

post '/' do

end

get '/:name' do
  "Hello #{params['name']}!"
end
