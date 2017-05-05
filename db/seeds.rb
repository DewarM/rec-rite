require('pry-byebug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

album1 = Album.new({
  'title' => 'Mungos greatest hits',
  'stock' => '10',
  'cover_url' => 'http://mungodewar.com/pic1.png'
  })

album1.save()

artist1 = Artist.new({
  'name' => 'Mungo Dewar',
  'picture' => 'http://mungodewar.com/pic2.png'
  })

artist1.save()

binding.pry
nil
