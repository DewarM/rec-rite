require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/helper')
require_relative('../models/album')
require_relative('../models/artist')

get '/albums' do
  @albums = Album.all()
  @artists = Artist.all()
  session.delete(:stock_level)
  session.delete(:artist_id)
  erb :"albums/index" do
    erb :"filters/form"
  end
end

get '/albums/new' do
  @artists = Artist.all()
  erb(:"albums/new")
end

post '/albums' do
  Helper.save_album_artist(params)
  redirect to("/albums")
end

post '/albums/:id/add_stock' do
   Album.find(params['id']).add_stock.update
   redirect = Helper.build_redirect(session)
   type = Helper.build_type(session)
  redirect redirect, type
end

post '/albums/:id/remove_stock' do
   Album.find(params['id']).remove_stock.update
   redirect = Helper.build_redirect(session)
   type = Helper.build_type(session)
   redirect redirect, type
end
