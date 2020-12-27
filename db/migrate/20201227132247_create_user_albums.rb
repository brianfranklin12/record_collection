class CreateUserAlbums < ActiveRecord::Migration
  def change
    create_table :user_albums do |t|
      t.integer :user_id
      t.integer :album_id
    end
  end
end
