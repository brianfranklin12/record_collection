class Album < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user

  def get_mbid
    release = MusicBrainz::ReleaseGroup.find_by_artist_and_title(self.artist.name, self.name, 'Album')
    if release
      release.id
    end
  end

  def get_coverart
    api = CoverArt::Client.new
    if self.get_mbid
      api.group "#{self.get_mbid}"
    end
  end

end