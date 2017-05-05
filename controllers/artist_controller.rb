require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')

get '/artist/new' do
  erb(:"artists/new")
end
