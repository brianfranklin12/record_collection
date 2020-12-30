class Album < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user

  def get_mbid
    MusicBrainz::ReleaseGroup.find_by_artist_and_title(self.artist.name, self.name, 'Album').id
  end

  def get_coverart
    api = CoverArt::Client.new
    api.group "#{self.get_mbid}"
  end

end