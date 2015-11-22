/*
Produce a list of costly bookings
Question
How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost, and do not use any subqueries.
*/
SELECT *
FROM
    (SELECT concat(firstname,' ',surname) AS member,
        name AS facility, 
    CASE WHEN memid=0 THEN guestcost*slots
        ELSE membercost*slots END AS cost
    FROM cd.bookings
    JOIN cd.facilities
    USING(facid)
    JOIN cd.members
    USING(memid)
    WHERE starttime::date='2012-09-14') AS t1
WHERE cost>30
SELECT concat(firstname,' ',surname) AS member,
    name AS facility,
CASE memid WHEN 0 THEN guestcost*slots
    ELSE membercost*slots END AS cost
FROM cd.bookings
JOIN cd.facilities
USING(facid)
JOIN cd.members
USING(memid)
WHERE starttime >= '2012-09-14' AND 
    starttime < '2012-09-15' AND
    ((memid = 0 AND slots*guestcost > 30) OR
        (memid != 0 AND slots*membercost > 30))


