require 'pry'
require_relative '../app/models/song.rb'
require_relative '../config/environment.rb'

# binding.pry

  def make_playlist(answer, user)
    case answer
    when 1
      puts "Here is an upbeat playlist for your workout."
      puts "--------------------------------------------"
      Song.list_random_songs_for_workout(user)
    when 2
      puts "Enjoy your chill time."
      puts "----------------------"
      Song.list_random_songs_for_chill(user)
    when 3
      puts "Here's a good mix!"
      puts "------------------"
      Song.list_random_songs_for_all(user)
    when 4
      puts "Here are your saved favorites."
      puts "-----------------------------"
      Song.favorite_songs_playlist(user)
    else
      puts "Please select correct number"
      puts "What would you like to listen to?
        1. Workout Music
        2. Chill Music
        3. Random Mix
        4. Saved Favorites" #this will be done by adding 1 song from each playlist they generate
      answer = gets.chomp.to_i
      make_playlist(answer, user)
      # picked_song = gets.chomp
    end
  end

  # def selected_song_by_user #method returns picked_song
  #   puts "If you would like to save a song to your playlist, select song number. To quit enter 0"
  #   picked_song = gets.chomp
  #   if picked_song.to_i > 0 && picked_song.to_i <= 15
  #       picked_song
  #   else
  #     picked_song == 0
  #   end
  # end
