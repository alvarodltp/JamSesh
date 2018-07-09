class CreateSongs < ActiveRecord::Migration[5.1]

  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :genre
      t.integer :energy_level
      t.integer :song_id
    end
  end

end
