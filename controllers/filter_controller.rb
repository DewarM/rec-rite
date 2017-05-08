require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album')

post '/filter' do
  stock_level = params['stock_level']
  session[:stock_level] = stock_level
  @albums = Album.filter_stock_level(stock_level)
  @artists = Artist.all()
  erb :"albums/index" do
    erb :"filters/form"
  end
end
