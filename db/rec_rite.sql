DROP TABLE albumartistjoins CASCADE;
DROP TABLE albumtagjoins CASCADE;
DROP TABLE tags CASCADE;
DROP TABLE stockrules CASCADE;
DROP TABLE artists CASCADE;
DROP TABLE albums CASCADE;

CREATE TABLE stockrules (
  id SERIAL4 PRIMARY KEY,
  stock_high INT4,
  stock_medium INT4,
  stock_low INT4
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  stock INT4,
  cover_url VARCHAR(255),
  stock_rule_id INT4 REFERENCES stockrules(id) DEFAULT 1
);

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  picture VARCHAR(255)
);

CREATE TABLE albumartistjoins (
  id SERIAL4 PRIMARY KEY,
  artist_id INT4 REFERENCES artists(id) ON DELETE CASCADE,
  album_id INT4 REFERENCES albums(id) ON DELETE CASCADE
);


CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albumtagjoins (
  id SERIAL4 PRIMARY KEY,
  album_id INT4 REFERENCES albums(id),
  tag_id INT4 REFERENCES tags(id)
);

INSERT INTO stockrules (
  stock_high,
  stock_medium,
  stock_low
) VALUES (
  1,
  5,
  10
);
