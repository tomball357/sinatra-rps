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
  plych = choice.sample
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
  erb(:rock)

  @outcome = "Player chose: #{plych}! Computer chose: #{cch}!"
  @final = final
end

get("/paper") do
  choice = ["rock", "paper", "scissors"]
  plych = choice.sample
  cch = choice.sample
	
  @outcome = "Player chose: #{plych}! Computer chose: #{cch}!"
	
  if plych == cch
    puts "It's a tie!"
  elsif (plych == "rock" && cch == "scissors") ||
        (plych == "paper" && cch == "rock") ||
        (plych == "scissors" && cch == "paper")
    puts "Player wins!"
  else
    puts "Computer wins!"
  end
  erb(:paper)
end

get("/scissors") do
  choice = ["rock", "paper", "scissors"]
  plych = choice.sample
  cch = choice.sample
	
  @outcome = "Player chose: #{plych}! Computer chose: #{cch}!"
	
  if plych == cch
    puts "It's a tie!"
  elsif (plych == "rock" && cch == "scissors") ||
        (plych == "paper" && cch == "rock") ||
        (plych == "scissors" && cch == "paper")
    puts "Player wins!"
  else
    puts "Computer wins!"
  end

  erb(:scissors)
end
