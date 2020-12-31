require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

MusicBrainz.configure do |c|
  c.app_name = "RecordCollection"
  c.app_version = "1.0"
  c.contact = "brianfranklinmusic@gmail.com"
end

require './app/controllers/application_controller'
require_all 'app'