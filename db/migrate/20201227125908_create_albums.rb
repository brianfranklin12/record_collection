class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :artist_id
      t.integer :year_released
      t.string :genre
      t.string :notes
    end
  end
end
