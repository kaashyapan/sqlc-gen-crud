
-- name: SelectAuthor :one
-- Select one Author using id
SELECT
    id
 ,  name
 ,  bio
FROM authors
WHERE id = @id ;

-- name: DeleteAuthor :exec
-- Delete one Author using id
DELETE FROM authors
WHERE id = @id ;

-- name: UpdateAuthor :one
-- Update one row of Author using id
UPDATE authors
SET 
    name = @name
 ,  bio = @bio
WHERE id = @id
RETURNING * ;

-- name: InsertAuthor :one
-- Insert one row of Author
INSERT INTO authors
( 
    name
 ,  bio
) VALUES (
    @name
 ,  @bio
)
RETURNING * ;

-- name: ListAuthor :many
-- Lists 1000 Author having id > @id
SELECT * FROM authors
WHERE id > @id
ORDER BY id
LIMIT 1000 ;

-- name: CountAuthor :one
-- Count # of Author
SELECT count(*) as author_count from authors ;

