require 'pry'
require_relative '../app/models/song.rb'
require_relative '../config/environment.rb'

# binding.pry

  def make_playlist(answer)
    case answer
    when 1
      Song.list_random_songs_for_workout
    when 2
      Song.list_random_songs_for_chill
    when 3
      Song.list_random_songs_for_all
    else
      puts "Please select correct number"
      puts "What would you like to listen to?
      1. Workout Music
      2. Chill Music
      3. Random Mix"
      answer = gets.chomp.to_i
      make_playlist(answer)
    end
  end
