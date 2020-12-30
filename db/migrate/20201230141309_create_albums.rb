class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :artist_id
      t.integer :user_id
      t.integer :year_released
      t.string :genre
      t.string :notes
      t.string :image_url
    end
  end
end
