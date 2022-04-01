require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' # always development

get '/' do
  'This is a simple simulated API endpoint to serve JSON data'
end

get '/api/restaurants' do
  restaurants = JSON.parse(File.read('restaurants.json'))

  json restaurants: restaurants
end
