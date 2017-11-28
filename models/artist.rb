require_relative("../db/sql_runner.rb")
require_relative("./album.rb")

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1)
    RETURNING *"
    values = [@name]
    album = SqlRunner.run(sql, values)
    @id = album.first['id'].to_i
  end

  def update()
    sql = "UPDATE artists
    SET
    name = $1
    WHERE id = $2"
    values = [@name, @id]
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
    artist = SqlRunner.run(sql, values).first
    result = Artist.new(artist)
    return result
  end

  def albums
    sql = "SELECT albums.* FROM albums
    INNER JOIN artists ON artists.id = albums.artist_id
    WHERE artists.id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    result = albums.map { |album| Album.new(album)}
    return result
  end

end
