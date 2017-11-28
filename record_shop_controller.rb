require('sinatra')
require('sinatra/reloader')

require_relative('./controllers/albums_controller.rb')
require_relative('./controllers/artists_controller.rb')
require_relative('./models/album.rb')

get '/' do
  @albums = Album.all
  @stock = Album.stock
  erb ( :index )
end
