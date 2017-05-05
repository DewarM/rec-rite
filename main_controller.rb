require('sinatra')
require('sinatra/contrib/all')
require_relative('models/helper')
require_relative('models/album')
require_relative('models/artist')


get '/' do
  redirect to('/albums')
end

get '/albums' do
  @albums = Album.all()
  erb(:index)
end

get '/albums/new' do
  @artists = Artist.all()
  erb(:new)
end

post '/albums' do
  Helper.save_album_artist(params)
  redirect to("/albums")
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
