require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')

get '/artists/new' do
  erb(:"artists/new")
end

post '/artists' do
  Artist.new(params).save()
  redirect to("/albums")
end
