require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stockrule')

get '/stockrules/new' do
  erb(:"stockrules/new")
end

post '/stockrules' do
  Stockrule.new(params).save()
  redirect to("/albums")
end
