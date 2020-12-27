class Artist < ActiveRecord::Base
  has_many :albums
  has_many :users, through: :albums
end