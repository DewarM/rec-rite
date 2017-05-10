require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')

get '/artists/new' do
  @artists = Artist.all()
  erb(:"artists/new")
end

post '/artists/:id' do
  Artist.new(params).update()
  redirect to("/albums")
end

post '/artists' do
  Artist.new(params).save()
  redirect to("/albums")
end

get '/artists/:id/edit' do
  @artists = Artist.all()
  @artist = Artist.find(params['id'])
  erb(:"artists/edit")
end

post '/artists/:id/delete' do
  Artist.find(params['id']).delete
  redirect to("/albums")
end
