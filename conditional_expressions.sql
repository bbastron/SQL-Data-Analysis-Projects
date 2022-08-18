/* Identify customer levels based on when they became a customer 
for promotional purposes */

SELECT customer_id,
CASE
	WHEN customer_id <= 100 THEN 'Premium'
	WHEN customer_id BETWEEN 100 AND 200 THEN 'Plus'
	ELSE 'Normal'
END AS customer_tier
FROM customer;



/* Label the winners of a customer raffle. */

SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second Place'
	ELSE 'Normal'
END AS raffle_results
FROM customer;



/* Show the number of bargain DVDs ($0.99), the number of DVDs with a regular
rental price ($2.99), and DVDs with a higher rental price ($4.99) all at the 
same time */

SELECT 
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS total_bargains,
SUM(CASE rental_rate
   	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM(CASE rental_rate
   	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film;



/* How many DVDs are in our inventory for each film rating? */

SELECT
SUM(CASE rating
   	WHEN 'G' THEN 1
   	ELSE 0
END) AS g,
SUM(CASE rating
   	WHEN 'PG' THEN 1
   	ELSE 0
END) AS pg,
SUM(CASE rating
   	WHEN 'PG-13' THEN 1
   	ELSE 0
END) AS pg13,
SUM(CASE rating
   	WHEN 'R' THEN 1
   	ELSE 0
END) AS r,
SUM(CASE rating
   	WHEN 'NC-17' THEN 1
   	ELSE 0
END) AS nc17
FROM film;



/* How many characters are in inventory_id values? */

SELECT DISTINCT(CHAR_LENGTH(CAST(inventory_id AS VARCHAR))) 
FROM rental;
