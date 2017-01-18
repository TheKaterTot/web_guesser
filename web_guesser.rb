require "sinatra"
require "sinatra/reloader"

def random
  rand(100)
end

SECRET_NUMBER = random

get "/" do
  erb :index, :locals => {:message => ""}
end

post "/" do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:message => message}
end

def check_guess(guess)
  if check_difference(guess, SECRET_NUMBER)
    "Way too high!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif check_difference(SECRET_NUMBER, guess)
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  else
    "You got it right! The number is #{number}."
  end
end

def check_difference(num1, num2)
  num1 - num2 > 5
end
