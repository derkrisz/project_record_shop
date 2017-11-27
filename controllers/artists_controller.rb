require('sinatra')
require('sinatra/reloader')
require_relative('../models/artist.rb')

#INDEX
get '/artist' do
  @artists = Artist.all
  erb ( :"artist/index" )
end

#NEW
get '/artist/new' do
  erb( :"artist/new" )
end

#CREATE
post '/artist' do
  @artist = Artist.new( params )
  @artist.save()
erb ( :"artist/create" )
end

#DELETE
delete '/artist/:id' do
  artist = Artist.find( params[:id] )
  artist.delete()
  redirect to '/'
end
