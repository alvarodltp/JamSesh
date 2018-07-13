require 'pry'
require_relative '../../config/environment.rb'
class Song < ActiveRecord::Base

  has_many :playlist_items

  def self.randomize_for_workout
    x = Song.select do |song|
      song.energy_level > 3
    end
    x.sample(15)
  end

  def self.randomize_for_chill
    x = Song.select do |song|
      song.energy_level <= 3
    end
    x.sample(15)
  end

  def self.randomize_for_all
    x = Song.select do |song|
      song
    end
    x.sample(15)
  end


    def self.list_random_songs_for_workout(user)
      y = self.randomize_for_workout.map.with_index(0) do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.artist}"
        song
      end

      puts "--------------------------------------------------------------------------------------"
      puts "If you would like to save a song to your Playlist, select song number. To quit enter 0."
      reply = gets.chomp.to_i

      if reply > 0 && reply <= 15
        song = y[reply-1]
        if PlaylistItem.all.find do |x|
          x.song_id == song.song_id
        end
          puts "----------------------------------------------------"
          puts "Song already in Playlist, please choose another one."
          reply = gets.chomp.to_i
        else
        user.create_playlist_item(song)
        end
      else
       reply == 0
      end
    end


  def self.list_random_songs_for_chill(user)
    y = self.randomize_for_chill.map.with_index(0) do |song, i|
      puts "#{i + 1}. #{song.name} - #{song.artist}"
      song
    end
      puts "--------------------------------------------------------------------------------------"
      puts "If you would like to save a song to your Playlist, select song number. To quit enter 0."
      reply = gets.chomp.to_i
      if reply > 0 && reply <= 15
        song = y[reply-1]
        if PlaylistItem.all.find do |x|
          x.song_id == song.song_id
        end
          puts "----------------------------------------------------"
          puts "Song already in Playlist, please choose another one."
        else
        user.create_playlist_item(song)
        end
     else
       reply == 0
    end
  end

  def self.list_random_songs_for_all(user)
    y = self.randomize_for_all.map.with_index(0) do |song, i|
      puts "#{i + 1}. #{song.name} - #{song.artist}"
      song
    end
      puts "--------------------------------------------------------------------------------------"
      puts "If you would like to save a song to your Playlist, select song number. To quit enter 0."
      reply = gets.chomp.to_i
      if reply > 0 && reply <= 15
        song = y[reply-1]
        if PlaylistItem.all.find do |x|
          x.song_id == song.song_id
        end
          puts "---------------------------------------------------"
          puts "Song already in Playlist, please choose another one."
        else
          user.create_playlist_item(song)
        end
     else
       reply == 0
    end
  end

  def self.favorite_songs_playlist(user)
    user.playlist_items.map.with_index(0) do |song, i|
      # binding.pry
      if user.user_id == song.user_id
        puts "#{i + 1}. #{song.title} - #{song.artist}"
      end
    end
  end

end
