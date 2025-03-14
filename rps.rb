require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

# Helper function for game logic
def rps_game(player_choice)
  choices = ["rock", "paper", "scissors"]
  computer_choice = choices.sample  # Random selection

  if player_choice == computer_choice
    result = "We tied!"
  elsif (player_choice == "rock" && computer_choice == "scissors") ||
        (player_choice == "paper" && computer_choice == "rock") ||
        (player_choice == "scissors" && computer_choice == "paper")
    result = "We won!"
  else
    result = "We lost!"
  end

  @outcome = "We played #{player_choice}, they played #{computer_choice}! #{result}"
end

# Homepage with game rules
get("/") do
  erb :rules
end

# Rock route
get("/rock") do
  @player_choice, @computer_choice, @result = rps_game("rock")
  erb :rock
end

# Paper route
get("/paper") do
  @player_choice, @computer_choice, @result = rps_game("paper")
  erb :paper
end

# Scissors route
get("/scissors") do
  @player_choice, @computer_choice, @result = rps_game("scissors")
  erb :scissors
end
