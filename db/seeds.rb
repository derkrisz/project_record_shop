require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require('pry-byebug')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name' => 'Machine Head'})
artist2 = Artist.new({'name' => 'Tool'})
artist3 = Artist.new({'name' => 'The Black Dahlia Murder'})
artist4 = Artist.new({'name' => 'Iron Maiden'})
artist5 = Artist.new({'name' => 'letlive.'})
artist6 = Artist.new({'name' => 'Mayhem'})
artist7 = Artist.new({'name' => 'Ignite'})
artist8 = Artist.new({'name' => 'Opeth'})
artist9 = Artist.new({'name' => 'Meshuggah'})

artist1.save
artist2.save
artist3.save
artist4.save
artist5.save
artist6.save
artist7.save
artist8.save
artist9.save


album1 = Album.new({
  'title' => 'Burn My Eyes',
  'quantity' => 5,
  'artist_id' => artist1.id,
  'buy_price' => 10,
  'sell_price' => 15,
  'genre' => 'metal'
  })

album2 = Album.new({
  'title' => 'The More Things Change',
  'quantity' => 1,
  'artist_id' => artist1.id,
  'buy_price' => 11,
  'sell_price' => 16,
  'genre' => 'metal'
  })

album3 = Album.new({
  'title' => 'Unto the Locust',
  'quantity' => 8,
  'artist_id' => artist1.id,
  'buy_price' => 9,
  'sell_price' => 12,
  'genre' => 'metal'
  })

album4 = Album.new({
  'title' => 'Lateralus',
  'quantity' => 3,
  'artist_id' => artist2.id,
  'buy_price' => 10,
  'sell_price' => 12,
  'genre' => 'nu metal'
  })

album5 = Album.new({
  'title' => 'Undertow',
  'quantity' => 2,
  'artist_id' => artist2.id,
  'buy_price' => 7,
  'sell_price' => 12,
  'genre' => 'nu metal'
  })

album6 = Album.new({
  'title' => 'Unhallowed',
  'quantity' => 13,
  'artist_id' => artist3.id,
  'buy_price' => 15,
  'sell_price' => 16,
  'genre' => 'melodic death metal'
  })

album7 = Album.new({
  'title' => 'Piece of Mind',
  'quantity' => 11,
  'artist_id' => artist4.id,
  'buy_price' => 10,
  'sell_price' => 20,
  'genre' => 'heavy metal'
  })

album8 = Album.new({
  'title' => 'Seventh Son of a Seventh Son',
  'quantity' => 4,
  'artist_id' => artist4.id,
  'buy_price' => 11,
  'sell_price' => 18,
  'genre' => 'heavy metal'
  })

album9 = Album.new({
  'title' => 'The Blackest Beautiful',
  'quantity' => 8,
  'artist_id' => artist5.id,
  'buy_price' => 13,
  'sell_price' => 25,
  'genre' => 'metalcore'
  })

album10 = Album.new({
  'title' => 'De Misteriis Dom Sathanas',
  'quantity' => 2,
  'artist_id' => artist6.id,
  'buy_price' => 9,
  'sell_price' => 16,
  'genre' => 'black metal'
  })

album11 = Album.new({
  'title' => 'Our Darkest Days',
  'quantity' => 6,
  'artist_id' => artist7.id,
  'buy_price' => 7,
  'sell_price' => 13,
  'genre' => 'hardcore'
  })

album12 = Album.new({
  'title' => 'Deliverance',
  'quantity' => 0,
  'artist_id' => artist8.id,
  'buy_price' => 8,
  'sell_price' => 18,
  'genre' => 'progressive metal'
  })

album13 = Album.new({
  'title' => 'Destroy Erase Improve',
  'quantity' => 0,
  'artist_id' => artist9.id,
  'buy_price' => 10,
  'sell_price' => 20,
  'genre' => 'experimental metal'
  })

album1.save
album2.save
album3.save
album4.save
album5.save
album6.save
album7.save
album8.save
album9.save
album10.save
album11.save
album12.save
album13.save

# binding.pry
# nil
