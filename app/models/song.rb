require 'pry'
require_relative '../../config/environment.rb'
class Song < ActiveRecord::Base

  belongs_to :playlist

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


    def self.list_random_songs_for_workout
      y = self.randomize_for_workout.map.with_index(0) do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.artist}"
        song
      end
      puts "If you would like to save a song to your playlist, select song number. To quit enter 0"
      reply = gets.chomp.to_i
      if reply > 0 && reply <= 15
        song = y[reply-1]
        if Playlist.all.find do |x|
          x.song_id == song.song_id
        end
          puts "Song already in playlist, please choose another one."
          reply = gets.chomp.to_i
        else
        Playlist.create(title: song.name, artist: song.artist, song_id: song.song_id, user_id: user)
        end
      else
       reply == 0
      end
    end


  def self.list_random_songs_for_chill
    y = self.randomize_for_chill.map.with_index(0) do |song, i|
      puts "#{i + 1}. #{song.name} - #{song.artist}"
      song
    end
      puts "If you would like to save a song to your playlist, select song number. To quit enter 0"
      reply = gets.chomp.to_i
      if reply > 0 && reply <= 15
        song = y[reply-1]
        if Playlist.all.find do |x|
          x.song_id == song.song_id
        end
          puts "Song already in playlist, please choose another one."
        else
        Playlist.create(title: song.name, artist: song.artist, song_id: song.song_id)
        end
     else
       reply == 0
    end
  end

  def self.list_random_songs_for_all
    y = self.randomize_for_all.map.with_index(0) do |song, i|
      puts "#{i + 1}. #{song.name} - #{song.artist}"
      song
    end
      puts "If you would like to save a song to your playlist, select song number. To quit enter 0"
      reply = gets.chomp.to_i
      if reply > 0 && reply <= 15
        song = y[reply-1]
        if Playlist.all.find do |x|
          x.song_id == song.song_id
        end
          puts "Song already in playlist"
        else
          Playlist.create(title: song.name, artist: song.artist, song_id: song.song_id)
        end
     else
       reply == 0
    end
  end

  def self.favorite_songs_playlist
    Playlist.all.map.with_index(0) do |song, i|
      puts "#{i + 1}. #{song.title} - #{song.artist}"
    end
  end

end
