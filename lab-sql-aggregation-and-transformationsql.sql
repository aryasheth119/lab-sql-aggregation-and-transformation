Use Sakila; 

SELECT MIN(length) AS min_duration, MAX(length) AS max_duration
FROM sakila.film;

SELECT CONCAT(FLOOR(AVG(length) / 60), ' hours ', AVG(length) % 60, ' minutes') AS average_duration
FROM sakila.film;

SELECT * FROM sakila.rental;
SELECT DATEDIFF(MAX(last_update), MIN(rental_date)) AS operating_days
FROM rental;

SELECT rental_id, rental_date, MONTH(rental_date) AS rental_month, DAYNAME(rental_date) AS rental_weekday
FROM sakila.rental
LIMIT 20;

SELECT rental_id, rental_date,
  CASE
    WHEN DAYNAME(rental_date) IN ('Saturday', 'Sunday') THEN 'weekend'
    ELSE 'workday'
  END AS day_type
FROM sakila.rental;

SELECT title, COALESCE(length, 'Not Available') AS rental_duration
FROM sakila.film
ORDER BY title ASC;

SELECT CONCAT(first_name, ' ', last_name) AS full_name, SUBSTRING(email, 1, 3) AS email_prefix
FROM sakila.customer
ORDER BY last_name ASC;

SELECT COUNT(*) AS total_films_released
FROM sakila.film;

SELECT rating, COUNT(*) AS film_count FROM sakila.film
GROUP BY rating;

SELECT rating, COUNT(*) AS film_count FROM sakila.film
GROUP BY rating
ORDER BY film_count DESC;

SELECT staff_id, COUNT(*) AS rental_count FROM sakila.rental
GROUP BY staff_id;

SELECT rating, ROUND(AVG(length), 2) AS mean_duration FROM sakila.film
GROUP BY rating
ORDER BY mean_duration DESC;

SELECT rating FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;

SELECT last_name FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;



