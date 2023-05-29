
-- name: SelectCity :one
-- Select one City using id
SELECT
    slug
 ,  name
FROM city
WHERE id = @id ;

-- name: DeleteCity :exec
-- Delete one City using id
DELETE FROM city
WHERE id = @id ;

-- name: UpdateCity :one
-- Update one row of City using id
UPDATE city
SET 
    slug = @slug
 ,  name = @name
WHERE id = @id
RETURNING * ;

-- name: InsertCity :one
-- Insert one row of City
INSERT INTO city
( 
    slug
 ,  name
) VALUES (
    @slug
 ,  @name
)
RETURNING * ;

-- name: ListCity :many
-- Lists 1000 City having id > @id
SELECT * FROM city
WHERE id > @id
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
WHERE id = @id ;

-- name: DeleteVenue :exec
-- Delete one Venue using id
DELETE FROM venue
WHERE id = @id ;

-- name: UpdateVenue :one
-- Update one row of Venue using id
UPDATE venue
SET 
    status = @status
 ,  statuses = @statuses
 ,  slug = @slug
 ,  name = @name
 ,  city = @city
 ,  spotify_playlist = @spotify_playlist
 ,  songkick_id = @songkick_id
 ,  tags = @tags
 ,  created_at = @created_at
WHERE id = @id
RETURNING * ;

-- name: InsertVenue :one
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
    @status
 ,  @statuses
 ,  @slug
 ,  @name
 ,  @city
 ,  @spotify_playlist
 ,  @songkick_id
 ,  @tags
 ,  @created_at
)
RETURNING * ;

-- name: ListVenue :many
-- Lists 1000 Venue having id > @id
SELECT * FROM venue
WHERE id > @id
ORDER BY id
LIMIT 1000 ;

-- name: CountVenue :one
-- Count # of Venue
SELECT count(*) as venue_count from venue ;

