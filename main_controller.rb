require('sinatra')
require('sinatra/contrib/all')
require_relative('models/album')

get '/' do
  redirect to('/albums')
end

get '/albums' do
  @albums = Album.all()
  erb(:index)
end
