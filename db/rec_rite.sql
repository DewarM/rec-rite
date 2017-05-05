DROP TABLE albumartistjoins;
DROP TABLE artists;
DROP TABLE albums;

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  stock INT4,
  cover_url VARCHAR(255)
);

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  cover_url VARCHAR(255)
);

CREATE TABLE albumartistjoins (
  id SERIAL4 PRIMARY KEY,
  artist_id INT4 REFERENCES artists(id),
  album_id INT4 REFERENCES albums(id)
)
