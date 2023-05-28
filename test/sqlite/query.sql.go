// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0
// source: query.sql

package authors

import (
	"context"
	"database/sql"
)

const deleteAuthor = `-- name: DeleteAuthor :exec
DELETE FROM authors
WHERE author_id = $1
`

// Delete one Author using author_id
func (q *Queries) DeleteAuthor(ctx context.Context, authorID int64) error {
	_, err := q.db.ExecContext(ctx, deleteAuthor, authorID)
	return err
}

const insertAuthor = `-- name: InsertAuthor :one
INSERT INTO authors
( 
    ssid
 ,  name
 ,  spouses
 ,  children
 ,  bio
 ,  acct
) VALUES (
    $1
 ,  $2
 ,  $3
 ,  $4
 ,  $5
 ,  $6
)
RETURNING author_id, ssid, name, spouses, children, bio, acct
`

type InsertAuthorParams struct {
	Ssid     sql.NullInt32
	Name     string
	Spouses  sql.NullInt32
	Children sql.NullInt32
	Bio      string
	Acct     sql.NullString
}

// Insert one row of Author
func (q *Queries) InsertAuthor(ctx context.Context, arg InsertAuthorParams) (Author, error) {
	row := q.db.QueryRowContext(ctx, insertAuthor,
		arg.Ssid,
		arg.Name,
		arg.Spouses,
		arg.Children,
		arg.Bio,
		arg.Acct,
	)
	var i Author
	err := row.Scan(
		&i.AuthorID,
		&i.Ssid,
		&i.Name,
		&i.Spouses,
		&i.Children,
		&i.Bio,
		&i.Acct,
	)
	return i, err
}

const listAuthor = `-- name: ListAuthor :many
SELECT author_id, ssid, name, spouses, children, bio, acct FROM authors
WHERE author_id > $1
ORDER BY author_id
LIMIT 1000
`

// Lists 1000 Author having id > @id
func (q *Queries) ListAuthor(ctx context.Context, authorID int64) ([]Author, error) {
	rows, err := q.db.QueryContext(ctx, listAuthor, authorID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Author
	for rows.Next() {
		var i Author
		if err := rows.Scan(
			&i.AuthorID,
			&i.Ssid,
			&i.Name,
			&i.Spouses,
			&i.Children,
			&i.Bio,
			&i.Acct,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const selectAuthor = `-- name: SelectAuthor :one
SELECT
    author_id
 ,  ssid
 ,  name
 ,  spouses
 ,  children
 ,  bio
 ,  acct
FROM authors
WHERE author_id = $1
`

// Select one Author using author_id
func (q *Queries) SelectAuthor(ctx context.Context, authorID int64) (Author, error) {
	row := q.db.QueryRowContext(ctx, selectAuthor, authorID)
	var i Author
	err := row.Scan(
		&i.AuthorID,
		&i.Ssid,
		&i.Name,
		&i.Spouses,
		&i.Children,
		&i.Bio,
		&i.Acct,
	)
	return i, err
}

const updateAuthor = `-- name: UpdateAuthor :one
UPDATE authors
SET 
    ssid = $1
 ,  name = $2
 ,  spouses = $3
 ,  children = $4
 ,  bio = $5
 ,  acct = $6
WHERE author_id = $7
RETURNING author_id, ssid, name, spouses, children, bio, acct
`

type UpdateAuthorParams struct {
	Ssid     sql.NullInt32
	Name     string
	Spouses  sql.NullInt32
	Children sql.NullInt32
	Bio      string
	Acct     sql.NullString
	AuthorID int64
}

// Update one row of Author using author_id
func (q *Queries) UpdateAuthor(ctx context.Context, arg UpdateAuthorParams) (Author, error) {
	row := q.db.QueryRowContext(ctx, updateAuthor,
		arg.Ssid,
		arg.Name,
		arg.Spouses,
		arg.Children,
		arg.Bio,
		arg.Acct,
		arg.AuthorID,
	)
	var i Author
	err := row.Scan(
		&i.AuthorID,
		&i.Ssid,
		&i.Name,
		&i.Spouses,
		&i.Children,
		&i.Bio,
		&i.Acct,
	)
	return i, err
}
