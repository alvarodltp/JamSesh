
require_relative '../config/environment.rb'
require_relative '../lib/cli.rb'

puts "Welcome to JamSesh! Let's make you an awesome playlist!"
puts "Please enter your name to access your account."
reply = gets.chomp.downcase
user = User.checking_user(reply)

puts "Welcome #{reply.capitalize}. Good to see you!"
puts "What would you like to listen to?
1. Workout Music
2. Chill Music
3. Random Mix
4. Saved Favorites"

answer = gets.chomp.to_i
make_playlist(answer)
# selected_song_by_user
