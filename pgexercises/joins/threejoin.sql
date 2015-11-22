/*
Produce a list of all members who have used a tennis court
Question
How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name.
*/
SELECT DISTINCT m1.firstname::text || ' ' || m1.surname::text AS member, 
    f1.name AS facility
FROM cd.members m1 
JOIN cd.bookings b1
USING(memid)
JOIN cd.facilities f1
USING(facid)
WHERE f1.name LIKE 'Tennis Court%'
ORDER by member
--or
SELECT DISTINCT 
concat_ws(' ', m1.firstname::text, m1.surname::text) AS member, 
    f1.name AS facility
FROM cd.members m1 
JOIN cd.bookings b1
USING(memid)
JOIN 
(SELECT *
 FROM cd.facilities f1
WHERE f1.name LIKE 'Tennis Court%') AS f1
USING(facid)
ORDER by member
--or
SELECT DISTINCT 
concat(m1.firstname::text,' ',m1.surname::text) AS member, 
    f1.name AS facility
FROM cd.members m1 
JOIN cd.bookings b1
USING(memid)
JOIN 
(SELECT *
 FROM cd.facilities f1
WHERE f1.facid IN (0,1)) AS f1
USING(facid)
ORDER by member
