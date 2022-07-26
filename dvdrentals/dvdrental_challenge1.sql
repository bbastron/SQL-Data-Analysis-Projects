/* Business situation: We want to send out a promotional email to our existing customers, and need a list of names and emails in order to do so. */

SELECT first_name,last_name,email FROM customer;


/* Business situation: A new customer is unfamiliar with MPAA ratings, and we want to know what types of ratings are in our database so we can explain them. */

SELECT DISTINCT rating FROM film;


/* Business situation: A customer, Nancy Thomas, left their wallet at our store and we need to email them. */

SELECT first_name,last_name,email FROM customer
WHERE first_name = 'Nancy' 
AND last_name = 'Thomas';


/* Business situation: A customer wants to know what the movie 'Outlaw Hanky' is about. What is the description for this movie? */

SELECT title,description FROM film
WHERE title = 'Outlaw Hanky';


/* Business situation: A customer is late on a movie return and we've already mailed a letter to their home at 259 Ipoh Drive. Now we need their phone number to call them. */

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';


/* Business situation: We want to reward our first 10 customers. What are the customer IDs for our first 10 paying customers? */

SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;


/* Business situation: A customer wants a film short enough to enjoy on their lunch break. What are the shortest 5 films in our inventory? */

SELECT title,length FROM film
ORDER BY length ASC
LIMIT 5;


/* Business situation: If the previous customer can watch any movie that is 50 minutes or less, how many options do they have? */

SELECT COUNT(*) FROM film
WHERE length <= 50;