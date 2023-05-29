
-- name: SelectPilot :one
-- Select one Pilot using id
SELECT
    id
 ,  name
FROM pilots
WHERE id = @id ;

-- name: DeletePilot :exec
-- Delete one Pilot using id
DELETE FROM pilots
WHERE id = @id ;

-- name: UpdatePilot :one
-- Update one row of Pilot using id
UPDATE pilots
SET 
    name = @name
WHERE id = @id
RETURNING * ;

-- name: InsertPilot :one
-- Insert one row of Pilot
INSERT INTO pilots
( 
    name
) VALUES (
    @name
)
RETURNING * ;

-- name: ListPilot :many
-- Lists 1000 Pilot having id > @id
SELECT * FROM pilots
WHERE id > @id
ORDER BY id
LIMIT 1000 ;

-- name: CountPilot :one
-- Count # of Pilot
SELECT count(*) as pilot_count from pilots ;

-- name: SelectJet :one
-- Select one Jet using id
SELECT
    id
 ,  pilot_id
 ,  age
 ,  name
 ,  color
FROM jets
WHERE id = @id ;

-- name: DeleteJet :exec
-- Delete one Jet using id
DELETE FROM jets
WHERE id = @id ;

-- name: UpdateJet :one
-- Update one row of Jet using id
UPDATE jets
SET 
    pilot_id = @pilot_id
 ,  age = @age
 ,  name = @name
 ,  color = @color
WHERE id = @id
RETURNING * ;

-- name: InsertJet :one
-- Insert one row of Jet
INSERT INTO jets
( 
    pilot_id
 ,  age
 ,  name
 ,  color
) VALUES (
    @pilot_id
 ,  @age
 ,  @name
 ,  @color
)
RETURNING * ;

-- name: ListJet :many
-- Lists 1000 Jet having id > @id
SELECT * FROM jets
WHERE id > @id
ORDER BY id
LIMIT 1000 ;

-- name: CountJet :one
-- Count # of Jet
SELECT count(*) as jet_count from jets ;

-- name: SelectLanguage :one
-- Select one Language using id
SELECT
    id
 ,  language
FROM languages
WHERE id = @id ;

-- name: DeleteLanguage :exec
-- Delete one Language using id
DELETE FROM languages
WHERE id = @id ;

-- name: UpdateLanguage :one
-- Update one row of Language using id
UPDATE languages
SET 
    language = @language
WHERE id = @id
RETURNING * ;

-- name: InsertLanguage :one
-- Insert one row of Language
INSERT INTO languages
( 
    language
) VALUES (
    @language
)
RETURNING * ;

-- name: ListLanguage :many
-- Lists 1000 Language having id > @id
SELECT * FROM languages
WHERE id > @id
ORDER BY id
LIMIT 1000 ;

-- name: CountLanguage :one
-- Count # of Language
SELECT count(*) as language_count from languages ;

-- name: SelectPilotLanguage :one
-- Select one PilotLanguage using id
SELECT
    pilot_id
 ,  language_id
FROM pilot_languages
WHERE id = @id ;

-- name: DeletePilotLanguage :exec
-- Delete one PilotLanguage using id
DELETE FROM pilot_languages
WHERE id = @id ;

-- name: UpdatePilotLanguage :one
-- Update one row of PilotLanguage using id
UPDATE pilot_languages
SET 
    pilot_id = @pilot_id
 ,  language_id = @language_id
WHERE id = @id
RETURNING * ;

-- name: InsertPilotLanguage :one
-- Insert one row of PilotLanguage
INSERT INTO pilot_languages
( 
    pilot_id
 ,  language_id
) VALUES (
    @pilot_id
 ,  @language_id
)
RETURNING * ;

-- name: ListPilotLanguage :many
-- Lists 1000 PilotLanguage having id > @id
SELECT * FROM pilot_languages
WHERE id > @id
ORDER BY id
LIMIT 1000 ;

-- name: CountPilotLanguage :one
-- Count # of PilotLanguage
SELECT count(*) as pilotlanguage_count from pilot_languages ;

