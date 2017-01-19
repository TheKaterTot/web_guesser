require "sinatra"
require "sinatra/reloader"
require "./guesser"


  get "/" do
    erb :index, :locals => {:message => ""}
  end

  post "/" do
    guess = params["guess"].to_i
    message = Guesser.check_guess(guess)
    erb :index, :locals => {:message => message}
  end
