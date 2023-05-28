
-- name: SelectAuthor :one
-- Select one Author using author_id
SELECT
    author_id
 ,  name
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
    name = @name
WHERE author_id = @author_id
RETURNING * ;

-- name: InsertAuthor :one
-- Insert one row of Author
INSERT INTO authors
( 
    name
) VALUES (
    @name
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
 ,  author_id
 ,  isbn
 ,  book_type
 ,  title
 ,  yr
 ,  available
 ,  tags
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
    author_id = @author_id
 ,  isbn = @isbn
 ,  book_type = @book_type
 ,  title = @title
 ,  yr = @yr
 ,  available = @available
 ,  tags = @tags
WHERE book_id = @book_id
RETURNING * ;

-- name: InsertBook :one
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
    @author_id
 ,  @isbn
 ,  @book_type
 ,  @title
 ,  @yr
 ,  @available
 ,  @tags
)
RETURNING * ;

-- name: ListBook :many
-- Lists 1000 Book having id > ?
SELECT * FROM books
WHERE book_id > @book_id
ORDER BY book_id
LIMIT 1000 ;

