require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require('pry-byebug')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name' => 'Machine Head'})
artist2 = Artist.new({'name' => 'Korn'})
artist3 = Artist.new({'name' => 'The Black Dahlia Murder'})
artist4 = Artist.new({'name' => 'Celine Dion'})

artist1.save
artist2.save
artist3.save
artist4.save


album1 = Album.new({
  'title' => 'Davidian',
  'quantity' => 5,
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'The More Things Change',
  'quantity' => 1,
  'artist_id' => artist1.id
  })

album3 = Album.new({
  'title' => 'The Burning Red',
  'quantity' => 8,
  'artist_id' => artist1.id
  })

album4 = Album.new({
  'title' => 'Korn',
  'quantity' => 3,
  'artist_id' => artist2.id
  })

album5 = Album.new({
  'title' => 'Life Is Peachy',
  'quantity' => 2,
  'artist_id' => artist2.id
  })

album6 = Album.new({
  'title' => 'Miasma',
  'quantity' => 13,
  'artist_id' => artist3.id
  })

album1.save
album2.save
album3.save
album4.save
album5.save
album6.save

binding.pry
nil
