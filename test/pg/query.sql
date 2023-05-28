
-- name: SelectAuthor :one
-- Select one Author using author_id
SELECT
    author_id
 ,  ssid
 ,  name
 ,  spouses
 ,  children
 ,  bio
 ,  acct
FROM authors
WHERE author_id = @author_id ;

-- name: DeleteAuthor :exec
-- Delete one Author using author_id
DELETE FROM authors
WHERE author_id = @author_id ;

-- name: UpdateAuthor :one
-- Update one row of Author using author_id
UPDATE authors
SET 
    ssid = @ssid
 ,  name = @name
 ,  spouses = @spouses
 ,  children = @children
 ,  bio = @bio
 ,  acct = @acct
WHERE author_id = @author_id
RETURNING * ;

-- name: InsertAuthor :one
-- Insert one row of Author
INSERT INTO authors
( 
    ssid
 ,  name
 ,  spouses
 ,  children
 ,  bio
 ,  acct
) VALUES (
    @ssid
 ,  @name
 ,  @spouses
 ,  @children
 ,  @bio
 ,  @acct
)
RETURNING * ;

-- name: ListAuthor :many
-- Lists 1000 Author having id > ?
SELECT * FROM authors
WHERE author_id > @author_id
ORDER BY author_id
LIMIT 1000 ;

-- name: SelectBook :one
-- Select one Book using book_id
SELECT
    book_id
 ,  name
FROM books
WHERE book_id = @book_id ;

-- name: DeleteBook :exec
-- Delete one Book using book_id
DELETE FROM books
WHERE book_id = @book_id ;

-- name: UpdateBook :one
-- Update one row of Book using book_id
UPDATE books
SET 
    name = @name
WHERE book_id = @book_id
RETURNING * ;

-- name: InsertBook :one
-- Insert one row of Book
INSERT INTO books
( 
    name
) VALUES (
    @name
)
RETURNING * ;

-- name: ListBook :many
-- Lists all Book 
SELECT * FROM books
ORDER BY book_id

