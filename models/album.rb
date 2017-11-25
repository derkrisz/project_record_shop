require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :title, :quantity

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @quantity = options['quantity'].to_i
  end

  def save
    sql = "INSERT INTO albums
    (title, quantity)
    VALUES
    ($1, $2)
    RETURNING *"
    values = [@title, @quantity]
    album = SqlRunner.run(sql, values)
    @id = album.first['id'].to_i
  end

  def update()
    sql = "UPDATE albums
    SET
    (title, quantity) = ($1, $2)
    WHERE id = $3"
    values = [@title, @quantity, @id]
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
    album = SqlRunner.run[sql, values]
    result = Album.new(album.first)
    return result
  end

end
