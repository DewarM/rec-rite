require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')
require_relative('../models/album_group.rb')
require_relative('../models/search.rb')

post '/filter' do
  @artists = Artist.all()

  stock_level = params['stock_level']
  artist_id = params['artist_id']

  session.delete(:search)
  session[:stock_level] = stock_level
  session[:artist_id] = artist_id

  albums = AlbumGroup.new(Album.all())
  @albums = albums.filter(stock_level, artist_id)

  if @albums == []
    erb :"albums/no_records" do
      erb :"filters/form"
    end
  else
    erb :"albums/index" do
      erb :"filters/form"
    end
  end
end

post '/filter/search' do
  search = params['search']

  session.delete(:stock_level)
  session.delete(:artist_id)
  session[:search] = search

  matcher = Search.new(search)
  matches = matcher.search()

  @searched_albums = matches[:albums]
  @searched_artists = matches[:artists]
  @artists = Artist.all()


  erb :"filters/search" do
    erb :"filters/form"
  end
end
