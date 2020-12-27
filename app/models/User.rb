class User < ActiveRecord::Base
  has_secure_password
  has_many :user_albums
  has_many :albums, through: :user_albums

  def slug
    self.username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find { |user| user.slug == slug }
  end

end