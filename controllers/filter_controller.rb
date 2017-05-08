require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album')

post '/filter' do
  @artists = Artist.all()

  stock_level = params['stock_level']
  artist_id = params['artist_id']

  session[:stock_level] = stock_level
  session[:artist_id] = artist_id

  @albums = Album.filter_stock_level(stock_level)
  
  erb :"albums/index" do
    erb :"filters/form"
  end
end
