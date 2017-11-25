require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_reader :id, :name, :album_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @album_id = options['album_id'].to_i
  end

  def save
    sql = "INSERT INTO artists
    (title, quantity, album_id)
    VALUES
    ($1, $2, $3)
    RETURNING *"
    values = [@title, @quantity, @album_id]
    album = SqlRunner.run(sql, values)
    @id = album.first['id'].to_i
  end

  def update()
    sql = "UPDATE artists
    SET
    (title, quantity, album_id) = ($1, $2, $3)
    WHERE id = $4"
    values = [@title, @quantity, @album_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE from artists"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * from artists"
    artists = SqlRunner.run(sql)
    result = artists.map {|artist| Artist.new(artist) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    artist = SqlRunner.run[sql, values]
    result = Artist.new(artist.first)
    return result
  end

end
