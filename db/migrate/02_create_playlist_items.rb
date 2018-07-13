class CreatePlaylistItems < ActiveRecord::Migration[5.1]

  def change
    create_table :playlist_items do |t|
      t.string :title
      t.string :artist
      t.integer :song_id
      t.integer :user_id
    end
  end
end
