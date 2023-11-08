require "sinatra"
require "active_record"
require "pp"

class User < ActiveRecord::Base
  self.table_name = 'users'
  self.primary_key = 'user_id'
end
User.establish_connection(
  adapter: "sqlite3",
  database: "db/test.db"
)
create_table(:users)
pp User.class
User.columns.each { |column|
  puts column.name
  puts column.type
}
#get '/' do
t = User.new
pp t


#end
