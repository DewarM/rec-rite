require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')
require_relative('../models/album_group.rb')
require_relative('../models/search.rb')

post '/filter' do
  @artists = Artist.all()

  stock_level = params['stock_level']
  artist_id = params['artist_id']

  session[:stock_level] = stock_level
  session[:artist_id] = artist_id

  albums = AlbumGroup.new(Album.all())
  @albums = albums.filter(stock_level, artist_id)

  erb :"albums/index" do
    erb :"filters/form"
  end
end

post '/filter/search' do
  matcher = Search.new(params['search'])
  matches= matcher.search()
  @searched_albums = matches[:albums]
  @seached_artists = matches[:artists]
  @artists = Artist.all()


  erb :"filters/search" do
    erb :"filters/form"
  end
end
