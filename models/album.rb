require_relative("../db/sql_runner.rb")
require_relative("./artist.rb")

class Album

  attr_reader :id, :title, :quantity, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums
    (title, quantity, artist_id)
    VALUES
    ($1, $2, $3)
    RETURNING *"
    values = [@title, @quantity, @artist_id]
    album = SqlRunner.run(sql, values)
    @id = album.first['id'].to_i
  end

  def update()
    sql = "UPDATE albums
    SET
    (title, quantity, artist_id) = ($1, $2, $3)
    WHERE id = $4"
    values = [@title, @quantity,@artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM albums
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE from albums"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * from albums"
    albums = SqlRunner.run(sql)
    result = albums.map {|album| Album.new(album) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM albums
    WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql, values)
    result = Album.new(album.first)
    return result
  end

  def self.stock
    sql = "SELECT SUM (quantity) FROM albums"
    stock = SqlRunner.run(sql)[0]["sum"].to_i
    return stock
  end

  def stock_level
    if @quantity > 10
      return "High stock"
    elsif @quantity < 5
      return "Low stock"
    else
      return "Medium stock"
    end
  end

end
