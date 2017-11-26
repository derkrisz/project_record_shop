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
  erb ( :index )
end

#NEW
get '/default/new' do
  erb( :new )
end

#CREATE
post '/students' do
  @student = Student.new( params )
  @student.save()
erb ( :create )
end

#SHOW
get '/default/index/:id' do
  @artists = Artist.find( params[:id] )
erb ( :show )
end
