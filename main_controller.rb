require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/album_controller.rb')
require_relative('controllers/artist_controller.rb')
require_relative('controllers/filter_controller.rb')
require_relative('controllers/stock_rule_controller.rb')
enable :sessions

get '/' do
  redirect to('/albums')
end
