class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :user_albums
  has_many :users, through: :user_albums

  def get_mbid
    MusicBrainz::ReleaseGroup.find_by_artist_and_title(self.artist.name, self.name).id
  end

  def get_coverart
    api = CoverArt::Client.new
    api.group "#{self.get_mbid}"
  end

end