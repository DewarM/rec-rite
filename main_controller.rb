require('sinatra')
require('sinatra/contrib/all')

get '/' do
  redirect to('/albums')
end

get '/albums' do
  erb(:index)
end
