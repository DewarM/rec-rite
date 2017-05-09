require('pry-byebug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/album_artist_join.rb')

album1 = Album.new({
  'title' => 'Reflektor',
  'stock' => '10',
  'cover_url' => 'https://upload.wikimedia.org/wikipedia/en/5/57/ArcadeFireReflektor.jpg'
  })

album2 = Album.new({
  'title' => "All 'n All",
  'stock' => '20',
  'cover_url' => 'https://upload.wikimedia.org/wikipedia/en/1/19/Earth%2C_Wind_%26_Fire_-_All%27N_All1.jpg'
  })


album1.save()
album2.save()

artist1 = Artist.new({
  'name' => 'Arcade Fire',
  'picture' => 'http://e.snmc.io/lk/f/a/9e9c8c61ed260017cdd5eb8c066e9683/930313.jpg'
})

artist2 = Artist.new({
  'name' => 'Earth, Wind & Fire',
  'picture' => "https://ichef-1.bbci.co.uk/news/624/cpsprodpb/1654F/production/_88117419_76960ec5-e7af-4146-b41c-7e3ed57f1af8.jpg"
  })

artist1.save()
artist2.save()

album_artist_join1 = AlbumArtistJoin.new({
  'artist_id' => "#{artist1.id}",
  'album_id' => "#{album1.id}"
  })

album_artist_join2 = AlbumArtistJoin.new({
  'artist_id' => "#{artist2.id}",
  'album_id' => "#{album2.id}"
  })

album_artist_join1.save()
album_artist_join2.save()
binding.pry
nil
