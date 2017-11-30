require('sinatra')
require('sinatra/reloader')
require('pry-byebug')
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

#SHOW
get '/albums/:id' do
  @album = Album.find( params[:id] )
  erb ( :"album/show")
end

#EDIT
get '/albums/:id/edit' do
  @album = Album.find( params[:id] )
  erb( :"album/edit" )
end

#UPDATE
put '/albums/:id' do
  Album.new( params ).update
  redirect to '/albums/' + params['id']
end

#DELETE
delete '/albums/:id' do
  album = Album.find( params[:id] )
  album.nullify_quantity
  redirect to '/albums/' + params['id']
end
