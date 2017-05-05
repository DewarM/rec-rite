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
