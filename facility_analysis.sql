/************** SQL ASSESSMENT EXAM 1 *****************/


/* 1. Which facilities charge a fee to be a member? */

SELECT * FROM cd.facilities
WHERE membercost > 0;


/* 2. Which facilities charge a member fee that is less than 1/50th of the cost of monthly maintenance? */

SELECT facid,name,membercost,monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 
AND (membercost < monthlymaintenance/50.0);


/* 3. Which facilities provide tennis? */

SELECT * FROM cd.facilities
WHERE name ILIKE '%tennis%';


/* 4. I need details for facility IDs 1 and 5. */

SELECT * FROM cd.facilities
WHERE facid IN(1,5);


/* 5. I need a list of members who joined on or after September 2012. */

SELECT * FROM cd.members
LIMIT 10;

SELECT * FROM cd.members
WHERE joindate >= '2012-09-01';


/* 6. I need an alphabetical list of the first 10 member last names, without any duplicates. */

SELECT DISTINCT(surname) FROM cd.members
ORDER BY surname ASC
LIMIT 10;


/* 7. When was the last time a member signed up? */

SELECT MAX(joindate) AS latest_signup 
FROM cd.members;


/* 8. How many facilities charge guests 10 or more? */

SELECT * FROM cd.facilities
LIMIT 5;

SELECT COUNT(*) FROM cd.facilities
WHERE guestcost > 10;


/* 9. How many bookings did each facility have during September 2012? */

SELECT * FROM cd.bookings
LIMIT 10;

SELECT facid,SUM(slots) AS total_bookings
FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01' AND '2012-10-01'
GROUP BY facid
ORDER BY SUM(slots) DESC;


/* 10. Which facilities (by facility id) had more than 1,000 bookings? */

SELECT facid,SUM(slots) AS total_bookings
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;


/* 11. When has member David Farrell booked their slots? */

SELECT * FROM cd.bookings;
SELECT * FROM cd.members;

SELECT surname,firstname,starttime
FROM cd.members
INNER JOIN cd.bookings
ON cd.members.memid = cd.bookings.memid
WHERE surname = 'Farrell' AND firstname = 'David';


/* 12. At what times did members book tennis courts on September 21, 2012? */

SELECT starttime AS start,name
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE starttime >= '2012-09-21' AND starttime < '2012-09-22'
AND cd.facilities.facid IN(0,1)
ORDER BY starttime;
