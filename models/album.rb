require_relative("../db/sql_runner.rb")
require_relative("./artist.rb")

class Album

  attr_reader :id, :title, :quantity, :artist_id, :buy_price, :sell_price, :genre

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
    @buy_price = options['buy_price'].to_f
    @sell_price = options['sell_price'].to_f
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO albums
    (title, quantity, artist_id, buy_price, sell_price, genre)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING *"
    values = [@title, @quantity, @artist_id, @buy_price, @sell_price, @genre]
    album = SqlRunner.run(sql, values)
    @id = album.first['id'].to_i
  end

  def update()
    sql = "UPDATE albums
    SET
    (title, quantity, artist_id, buy_price, sell_price, genre) =
    ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@title, @quantity, @artist_id, @buy_price, @sell_price, @genre, @id]
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
    if @quantity == 0
      return "Out of stock"
    elsif @quantity > 10
      return "High stock"
    elsif @quantity < 5
      return "Low stock"
    else
      return "Medium stock"
    end
  end

  def stock_css
    if @quantity == 0
      return "stock_out"
    elsif @quantity > 10
      return "high_stock"
    elsif @quantity < 5
      return "low_stock"
    else
      return "medium_stock"
    end
  end

  def markup
    margin = @sell_price-@buy_price
    markup = ((margin/@buy_price)*100).to_i
    return "#{markup}%"
  end

  def artist
    sql = "SELECT * FROM albums
    INNER JOIN artists
    ON artists.id = albums.artist_id
    WHERE albums.id = $1"
    values = [@id]
    artist = SqlRunner.run(sql, values).first
    result = Artist.new(artist)
    return result
  end

  def nullify_quantity
    @quantity = 0
    self.update
  end

end
