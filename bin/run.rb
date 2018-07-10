
require_relative '../config/environment.rb'
require_relative '../lib/cli.rb'

puts "Welcome to JamSesh! Let's make you an awesome playlist!"
puts "What are you up to?
1. Workout"
answer = gets.chomp.to_i
make_playlist(answer)
