class CreatePlaylist < ActiveRecord::Migration[5.1]

  def change
    create_table :playlist do |t|
      t.string :title
      t.integer :playlist_id
    end
  end
end
