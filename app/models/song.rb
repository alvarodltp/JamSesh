require 'pry'

class Song < ActiveRecord::Base

  # @@all = []
  #
  # def initialize(song)
  #   @song = song
  #   @@all << self
  # end
  #
  # def self.all
  #   @@all
  # end
      # binding.pry
  def self.randomize_for_workout
    x = Song.select do |song|
      song.energy_level > 3
    end
    x.sample(4)
  end

  def self.randomize_for_chill
    x = Song.select do |song|
      song.energy_level <= 3
    end
    x.sample(4)
  end

  def self.randomize_for_all
    x = Song.select do |song|
      song
    end
    x.sample(4)
  end


  def self.list_random_songs_for_workout
    self.randomize_for_workout.map.with_index(0) do |song, i|
      puts "#{i + 1}. '#{song.name}' - #{song.artist}"
    end
  end

  def self.list_random_songs_for_chill
    self.randomize_for_chill.map.with_index(0) do |song, i|
      puts "#{i + 1}. '#{song.name}' - #{song.artist}"
    end
  end

  def self.list_random_songs_for_all
    self.randomize_for_all.map.with_index(0) do |song, i|
      puts "#{i + 1}. '#{song.name}' - #{song.artist}"
    end
  end

end
