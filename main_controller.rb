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

post '/albums/:id/add_stock' do
  album = Album.find(params['id'])
  album.add_stock
  album.update
  redirect to ('/albums')
end

post '/albums/:id/remove_stock' do
  album = Album.find(params['id'])
  album.remove_stock
  album.update
  redirect to ('/albums')
end
