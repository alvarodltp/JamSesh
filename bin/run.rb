
require_relative '../config/environment.rb'
require_relative '../lib/cli.rb'

puts "Welcome to JamSesh! Let's make you an awesome playlist!"
puts "What would you like to listen to?
1. Workout Music
2. Chill Music
3. Random Mix
4. Saved Favorites"

answer = gets.chomp.to_i
make_playlist(answer)
# selected_song_by_user
