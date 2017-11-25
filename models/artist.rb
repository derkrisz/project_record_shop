require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_reader :id, :name, :album_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @album_id = options['album_id'].to_i
  end

end
