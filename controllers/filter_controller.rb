require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album')

post '/filter' do
  stock_level = params['stock_level']
  @filtered_albums = Album.filter_stock_level(stock_level)
  erb(:"filters/index")
end
