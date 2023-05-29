
-- name: SelectCity :one
-- Select one City using id
SELECT
    slug
 ,  name
FROM city
WHERE id = ? ;

-- name: DeleteCity :exec
-- Delete one City using id
DELETE FROM city
WHERE id = ? ;

-- name: UpdateCity :exec
-- Update one row of City using id
UPDATE city
SET 
    slug = ?
 ,  name = ?
WHERE id = ? ;

-- name: InsertCity :execresult
-- Insert one row of City
INSERT INTO city
( 
    slug
 ,  name
) VALUES (
    ?
 ,  ?
) ;

-- name: ListCity :many
-- Lists 1000 City having id > ?
SELECT * FROM city
WHERE id > ?
ORDER BY id
LIMIT 1000 ;

-- name: CountCity :one
-- Count # of City
SELECT count(*) as city_count from city ;

-- name: SelectVenue :one
-- Select one Venue using id
SELECT
    id
 ,  status
 ,  statuses
 ,  slug
 ,  name
 ,  city
 ,  spotify_playlist
 ,  songkick_id
 ,  tags
 ,  created_at
FROM venue
WHERE id = ? ;

-- name: DeleteVenue :exec
-- Delete one Venue using id
DELETE FROM venue
WHERE id = ? ;

-- name: UpdateVenue :exec
-- Update one row of Venue using id
UPDATE venue
SET 
    status = ?
 ,  statuses = ?
 ,  slug = ?
 ,  name = ?
 ,  city = ?
 ,  spotify_playlist = ?
 ,  songkick_id = ?
 ,  tags = ?
 ,  created_at = ?
WHERE id = ? ;

-- name: InsertVenue :execresult
-- Insert one row of Venue
INSERT INTO venue
( 
    status
 ,  statuses
 ,  slug
 ,  name
 ,  city
 ,  spotify_playlist
 ,  songkick_id
 ,  tags
 ,  created_at
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
) ;

-- name: ListVenue :many
-- Lists 1000 Venue having id > ?
SELECT * FROM venue
WHERE id > ?
ORDER BY id
LIMIT 1000 ;

-- name: CountVenue :one
-- Count # of Venue
SELECT count(*) as venue_count from venue ;

