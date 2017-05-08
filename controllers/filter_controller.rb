require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')
require_relative('../models/album_group.rb')

post '/filter' do
  @artists = Artist.all()

  stock_level = params['stock_level']
  artist_id = params['artist_id']

  session[:stock_level] = stock_level
  session[:artist_id] = artist_id


  albums = AlbumGroup.new(Album.all())
  @albums = albums.filter_stock_level(stock_level).filter_artist(artist_id).album_array

  erb :"albums/index" do
    erb :"filters/form"
  end
end
