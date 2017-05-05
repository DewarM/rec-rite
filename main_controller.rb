require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/album_controller.rb')
require_relative('controllers/artist_controller.rb')

get '/' do
  redirect to('/albums')
end
