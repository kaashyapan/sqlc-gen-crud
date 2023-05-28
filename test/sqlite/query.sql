
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
 ,  address = @address
 ,  date_of_birth = @date_of_birth
 ,  last_ts = @last_ts
 ,  savings_amt = @savings_amt
 ,  loan_amt = @loan_amt
 ,  disabled = @disabled
 ,  married = @married
 ,  payable = @payable
WHERE id = @id
RETURNING * ;

-- name: InsertAuthor :one
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
    @name
 ,  @bio
 ,  @address
 ,  @date_of_birth
 ,  @last_ts
 ,  @savings_amt
 ,  @loan_amt
 ,  @disabled
 ,  @married
 ,  @payable
)
RETURNING * ;

-- name: ListAuthor :many
-- Lists 1000 Author having id > ?
SELECT * FROM authors
WHERE id > @id
ORDER BY id
LIMIT 1000 ;

