class CreatePlaylists < ActiveRecord::Migration[5.1]

  def change
    create_table :playlists do |t|
      t.string :title
      t.string :artist
      t.integer :song_id
      t.integer :user_id
    end
  end
end
