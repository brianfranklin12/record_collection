ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, "sqlite3://database.db"
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host => db.host,
    :username => db.username,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

MusicBrainz.configure do |c|
  c.app_name = "RecordCollection"
  c.app_version = "1.0"
  c.contact = "brianfranklinmusic@gmail.com"
end

require './app/controllers/application_controller'
require_all 'app'

# configure :production do 
#   db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

#   ActiveRecord::Base.establish_connection(
#     :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#     :host => db.host,
#     :username => db.user,
#     :password => db.password,
#     :database => db.path[1..-1],
#     :encoding => 'utf8'
#   )
# end
