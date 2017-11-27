require('sinatra')
require('sinatra/reloader')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')


#NEW
get '/album/new' do
  @artists = Artist.all
  erb( :"album/new" )
end

#CREATE
post '/album' do
  @album = Album.new( params )
  @album.save()
erb ( :"album/create" )
end
