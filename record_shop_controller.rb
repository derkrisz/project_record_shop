require('sinatra')
require('sinatra/reloader')


require_relative('./controllers/albums_controller.rb')
require_relative('./controllers/artists_controller.rb')

get '/' do
  erb ( :index )
end
