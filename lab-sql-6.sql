show variables like 'local_infile';
set global local_infile = 1;
SET SQL_SAFE_UPDATES = 0;

select * from sakila.films_2020;
SELECT * FROM sakila.film; 
-- Instructions
-- Add the new films to the database. Wizard 

INSERT INTO sakila.film (film_id, title, description, release_year, language_id, original_language_id, length, rating)
SELECT film_id, title, description, release_year, language_id, original_language_id, length, rating
FROM films_2020
WHERE NOT EXISTS (
    SELECT 1 FROM sakila.film WHERE films_2020.film_id = sakila.film.film_id
);

-- Update information on rental_duration, rental_rate, and replacement_cost.
UPDATE sakila.film
SET
    rental_duration = 3,
    rental_rate = 2.99,
    replacement_cost = 8.99
WHERE
    film_id IN (SELECT film_id FROM films_2020);
 COMMIT;

SELECT * FROM sakila.film WHERE release_year = 2020;
SHOW WARNINGS;
SELECT film_id, title, release_year FROM film WHERE release_year = 2020;
COMMIT;