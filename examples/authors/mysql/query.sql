
-- name: SelectAuthor :one
-- Select one Author using id
SELECT
    id
 ,  name
 ,  bio
FROM authors
WHERE id = ? ;

-- name: DeleteAuthor :exec
-- Delete one Author using id
DELETE FROM authors
WHERE id = ? ;

-- name: UpdateAuthor :exec
-- Update one row of Author using id
UPDATE authors
SET 
    name = ?
 ,  bio = ?
WHERE id = ? ;

-- name: InsertAuthor :execresult
-- Insert one row of Author
INSERT INTO authors
( 
    name
 ,  bio
) VALUES (
    ?
 ,  ?
) ;

-- name: ListAuthor :many
-- Lists 1000 Author having id > ?
SELECT * FROM authors
WHERE id > ?
ORDER BY id
LIMIT 1000 ;

-- name: CountAuthor :one
-- Count # of Author
SELECT count(*) as author_count from authors ;

