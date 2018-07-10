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

  def self.randomize
    arr = []
    x = Song.all.sample(5)
    x.each do |song|
      if song.energy_level > 3
        arr << song
      end
    end
    arr
  end

  def self.list_random_songs
    self.randomize.map.with_index(0) do |song, i|
      "#{i + 1}. '#{song.name}' - #{song.artist}"
    end
  end
end
