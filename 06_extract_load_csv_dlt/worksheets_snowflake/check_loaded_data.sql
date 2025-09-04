USE ROLE movies_reader_role;

SHOW DATABASES;

USE DATABASE movies_db;

DESC DATABASE movies_db;

DESC SCHEMA staging;

DESC TABLE staging.netflix_originals;

SELECT * FROM staging.netflix_originals;

SELECT * FROM staging.netflix_originals LIMIT 10;

SELECT COUNT(*) AS total_records FROM staging.netflix_originals;

SELECT COUNT(DISTINCT title) AS unique_titles FROM staging.netflix_originals;

SELECT title, genre, imdb_score
FROM staging.netflix_originals
ORDER BY imdb_score DESC
LIMIT 10;