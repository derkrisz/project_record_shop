DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id serial4 PRIMARY KEY,
  title VARCHAR(255),
  quantity INT4,
  artist_id int4 REFERENCES artists(id) ON DELETE CASCADE
  buy_price INT4
  sell_price INT4
  genre VARCHAR(255)
);
