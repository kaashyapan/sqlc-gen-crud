
-- name: SelectAuthor :one
-- Select one Author using id
SELECT
    id
 ,  name
 ,  bio
 ,  address
 ,  date_of_birth
 ,  last_ts
 ,  savings_amt
 ,  loan_amt
 ,  disabled
 ,  married
 ,  payable
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
 ,  address = ?
 ,  date_of_birth = ?
 ,  last_ts = ?
 ,  savings_amt = ?
 ,  loan_amt = ?
 ,  disabled = ?
 ,  married = ?
 ,  payable = ?
WHERE id = ? ;

-- name: InsertAuthor :execresult
-- Insert one row of Author
INSERT INTO authors
( 
    name
 ,  bio
 ,  address
 ,  date_of_birth
 ,  last_ts
 ,  savings_amt
 ,  loan_amt
 ,  disabled
 ,  married
 ,  payable
) VALUES (
    ?
 ,  ?
 ,  ?
 ,  ?
 ,  ?
 ,  ?
 ,  ?
 ,  ?
 ,  ?
 ,  ?
) ;

-- name: ListAuthor :many
-- Lists 1000 Author having id > ?
SELECT * FROM authors
WHERE id > ?
ORDER BY id
LIMIT 1000 ;

