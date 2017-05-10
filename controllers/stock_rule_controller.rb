require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stockrule')
require_relative('../models/artist')

get '/stockrules/new' do
  @artists = Artist.all()
  erb(:"stockrules/new")
end

post '/stockrules' do
  Stockrule.new(params).save()
  redirect to("/albums")
end
