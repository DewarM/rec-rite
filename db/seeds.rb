require('pry-byebug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/album-artist-join.rb')

album1 = Album.new({
  'title' => 'Mungos greatest hits',
  'stock' => '10',
  'cover_url' => 'http://mungodewar.com/pic1.png'
  })

album2 = Album.new({
  'title' => 'Mungos greatest hits vol2',
  'stock' => '20',
  'cover_url' => 'http://mungodewar.com/pic2.png'
  })


album1.save()
album2.save()

artist1 = Artist.new({
  'name' => 'Mungo Dewar',
  'picture' => 'http://mungodewar.com/pic2.png'
  })

artist1.save()

album_artist_join1 = AlbumArtistJoin.new({
  'artist_id' => "#{artist1.id}",
  'album_id' => "#{album1.id}"
  })

album_artist_join1.save()
binding.pry
nil
