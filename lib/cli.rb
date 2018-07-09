def welcome
  puts "Welcome to JamSesh! Let's make you an awesome playlist!"
end

def get_input_from_user
  puts "What are you up to?/n
  1. Workout"
  answer = gets.chomp
  if answer == 1
    #will finish statement
  else
    puts "Please select correct number"
  end
end
