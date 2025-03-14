require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  erb(:home)
end

get("/rock") do
  choice = ["rock", "paper", "scissors"]
  plych = "rock"
  cch = choice.sample
	
  if plych == cch
    final = "It's a tie"
  elsif (plych == "rock" && cch == "scissors") ||
        (plych == "paper" && cch == "rock") ||
        (plych == "scissors" && cch == "paper")
    final = "We won"
  else
    final = "We lost"
  end
  

  @outcome = "We chose #{plych}! They chose #{cch}! #{final}!"
  erb(:rock)
end

get("/paper") do
  choice = ["rock", "paper", "scissors"]
  plych = "paper"
  cch = choice.sample
	
  if plych == cch
    final = "It's a tie!"
  elsif (plych == "rock" && cch == "scissors") ||
        (plych == "paper" && cch == "rock") ||
        (plych == "scissors" && cch == "paper")
    final = "We won!"
  else
    final = "We lost!"
  end

  @outcome = "We chose #{plych}! They chose #{cch}! #{final}!"
  erb(:paper)
end

get("/scissors") do
  choice = ["rock", "paper", "scissors"]
  plych = "scissors"
  cch = choice.sample
	
  if plych == cch
    final = "It's a tie!"
  elsif (plych == "rock" && cch == "scissors") ||
        (plych == "paper" && cch == "rock") ||
        (plych == "scissors" && cch == "paper")
    final = "We won!"
  else
    final = "We lost!"
  end

  @outcome = "We chose #{plych}! They chose #{cch}! #{final}!"
  erb(:scissors)
end
