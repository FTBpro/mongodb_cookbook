def add_admin(username, password, roles = [], database)
  require 'rubygems'
  require 'mongo'

  connection = retrieve_db
  db = connection.db(database)
  db.add_user(username, password, false, :roles => roles)
  Chef::Log.info("Created or updated user #{username} on #{database}")
end

# Get the MongoClient connection
def retrieve_db
  require 'rubygems'
  require 'mongo'

  Mongo::MongoClient.new(
    "localhost",
    "27017",
    :connect_timeout => 180
  )
end

action :add do
  add_admin(new_resource.username, new_resource.password, new_resource.roles, 'admin')
end
