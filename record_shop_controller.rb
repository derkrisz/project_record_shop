require('sinatra')
require('sinatra/reloader')


require_relative('./models/album.rb')
require_relative('./models/artist.rb')

#DEFAULT
get '/default' do
  erb ( :default )
end

#INDEX
get '/default/index' do
  @artists = Artist.all
  @stock = Album.stock
  erb ( :index )
end

#NEW
get '/default/new' do
  erb( :new )
end

#SHOW
get '/default/index/:id' do
  @albums = Album.find( params[:id] )
erb ( :show )
end

#CREATE
post '/default' do
  @artist = Artist.new( params )
  @artist.save()
erb ( :default )
end

#DELETE
delete '/default/index/:id' do
  artist = Artist.find( params[:id] )
  artist.delete()
  redirect to '/default/index'
end
