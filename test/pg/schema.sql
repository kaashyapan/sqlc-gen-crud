-- Example queries for sqlc
DROP TABLE IF EXISTS authors; 

CREATE TABLE authors (
  author_id   BIGINT PRIMARY KEY,
  ssid INT,
  name CHARACTER VARYING(255)  NOT NULL,
  spouses INT,
  children INT,
  bio  CHARACTER VARYING(255)  NOT NULL,
  acct decimal
);

CREATE TABLE books (
  book_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name CHARACTER VARYING(255)  NOT NULL
);
