require 'pry'

class User < ActiveRecord::Base

  has_many :playlist_items
  has_many :songs, through: :playlist_items

  def self.checking_user(reply) #checks if user exists
    User.all.find do |user|
      user.name.downcase == reply
    end
  end

  #make a class method that creates playlist create_playlist. passing thos methodin the Song.list_random_songs_for_workout(user)
  def create_playlist_item(song)
     PlaylistItem.create(title: song.name, artist: song.artist, song_id: song.song_id, user_id: self.user_id)
  end
end
