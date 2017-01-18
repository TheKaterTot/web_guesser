require "sinatra"
require "sinatra/reloader"

def random
  rand(100)
end

num = random

get "/" do
  "The secret number is: #{num}"
end
