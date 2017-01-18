require "sinatra"
require "sinatra/reloader"

def random
  rand(100)
end

number = random

get "/" do
  erb :index, :locals => {:number => number}
end
