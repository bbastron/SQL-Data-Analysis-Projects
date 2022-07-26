/* Sales tax laws in California have changed and we need to alert our customers. What are the email addresses for California customers? */

SELECT district,email FROM address
INNER JOIN customer
ON customer.address_id = address.address_id
WHERE district = 'California';


/* A customer walks in and is a big fan of the actor Nick Wahlberg. They want to know what films we have with this actor. */

SELECT title,first_name,last_name FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick'
AND last_name = 'Wahlberg';


/* During which months did payments occur? Include the full month name. */

SELECT DISTINCT(TO_CHAR(payment_date,'MONTH'))
FROM payment;


/* How many payments occured on a Monday? */
/* PostgreSQL considers Sunday (index=0) the start of the week. */

SELECT COUNT(*) FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;