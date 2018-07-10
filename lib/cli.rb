require 'pry'
require_relative '../app/models/song.rb'
require_relative '../config/environment.rb'

# binding.pry

  def make_playlist(answer)
    if answer == 1
      Song.list_random_songs
    else
      puts "Please select correct number"
    end
  end
