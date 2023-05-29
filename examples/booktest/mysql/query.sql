
-- name: SelectAuthor :one
-- Select one Author using author_id
SELECT
    author_id
 ,  name
FROM authors
WHERE author_id = ? ;

-- name: DeleteAuthor :exec
-- Delete one Author using author_id
DELETE FROM authors
WHERE author_id = ? ;

-- name: UpdateAuthor :exec
-- Update one row of Author using author_id
UPDATE authors
SET 
    name = ?
WHERE author_id = ? ;

-- name: InsertAuthor :execresult
-- Insert one row of Author
INSERT INTO authors
( 
    name
) VALUES (
    ?
) ;

-- name: ListAuthor :many
-- Lists 1000 Author having id > ?
SELECT * FROM authors
WHERE author_id > ?
ORDER BY author_id
LIMIT 1000 ;

-- name: CountAuthor :one
-- Count # of Author
SELECT count(*) as author_count from authors ;

-- name: SelectBook :one
-- Select one Book using book_id
SELECT
    book_id
 ,  author_id
 ,  isbn
 ,  book_type
 ,  title
 ,  yr
 ,  available
 ,  tags
FROM books
WHERE book_id = ? ;

-- name: DeleteBook :exec
-- Delete one Book using book_id
DELETE FROM books
WHERE book_id = ? ;

-- name: UpdateBook :exec
-- Update one row of Book using book_id
UPDATE books
SET 
    author_id = ?
 ,  isbn = ?
 ,  book_type = ?
 ,  title = ?
 ,  yr = ?
 ,  available = ?
 ,  tags = ?
WHERE book_id = ? ;

-- name: InsertBook :execresult
-- Insert one row of Book
INSERT INTO books
( 
    author_id
 ,  isbn
 ,  book_type
 ,  title
 ,  yr
 ,  available
 ,  tags
) VALUES (
    ?
 ,  ?
 ,  ?
 ,  ?
 ,  ?
 ,  ?
 ,  ?
) ;

-- name: ListBook :many
-- Lists 1000 Book having id > ?
SELECT * FROM books
WHERE book_id > ?
ORDER BY book_id
LIMIT 1000 ;

-- name: CountBook :one
-- Count # of Book
SELECT count(*) as book_count from books ;

