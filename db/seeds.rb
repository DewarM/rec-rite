require('pry-byebug')
require_relative('../models/album.rb')

album1 = Album.new({
  'title' => 'Mungos greatest hits',
  'stock' => '10',
  'cover_url' => 'http://mungodewar.com/pic1.png'
  })

album1.save()

binding.pry
nil
