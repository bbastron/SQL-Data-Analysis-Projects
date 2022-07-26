/* How many payment transactions were greater than $5.00? */

SELECT COUNT(amount) FROM payment
WHERE amount > 5;


/* How many actors have a first name that starts with the letter P? */

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';


/* How many unique districts are our customers from? */

SELECT COUNT(DISTINCT(district)) FROM address;


/* Retrieve a list of names for those distinct districts. */

SELECT DISTINCT(district) FROM address;


/* How many films have an R rating and a replacement cost between $5 and $15? */

SELECT COUNT(*) FROM film
WHERE rating = 'R' 
AND replacement_cost BETWEEN 5 AND 15;


/* How many films have the word Truman somewhere in the title? */

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';


/* We want to give a bonus to the staff member who has processed the most payments. Who would this be? */

SELECT staff_id,COUNT(amount)
FROM payment
GROUP BY staff_id
LIMIT 1;


/* Corporate is analyzing the relationship between movie rating and replacement cost. What is the average replacement cost per rating? */

SELECT rating,
ROUND(AVG(replacement_cost),2) 
FROM film
GROUP BY rating;


/* We are running a promotion to reward our top 5 customers with coupons. What are the customer ids of the 5 customers who have spent the most? */

SELECT customer_id,
SUM(amount) AS total_spent 
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;


/* We're launching a platinum service for our most loyal customers, those who have had 40 or more transactions. What customers are eligible? */

SELECT customer_id,COUNT(*)
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40;


/* Which customers have spent more than $100 with staff ID 2? */

SELECT customer_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;