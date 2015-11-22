/*
Produce a list of costly bookings, using a subquery 
Question
The Produce a list of costly bookings exercise contained some messy logic: we had to calculate the booking cost in both the WHERE clause and the CASE statement. Try to simplify this calculation using subqueries. For reference, the question was:
How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost.
*/
SELECT *
FROM
(SELECT --a contrived use of subqueries just for fun
    (SELECT concat(firstname,' ',surname) 
        FROM cd.members AS m1 
        WHERE m1.memid=b1.memid) AS member,
    (SELECT name
        FROM cd.facilities AS f1 
        WHERE f1.facid=b1.facid) AS facility,
    (CASE WHEN b1.memid=0 AND f2.guestcost*b1.slots>30 AND starttime::date='2012-09-14'
                THEN f2.guestcost*b1.slots
            WHEN f2.membercost*b1.slots>30 AND starttime::date='2012-09-14'
                THEN f2.membercost*b1.slots END
        ) AS cost
FROM cd.bookings AS b1
JOIN cd.facilities AS f2
USING(facid)) AS s1
WHERE cost IS NOT NULL
ORDER BY cost DESC
--let's do better
SELECT *
FROM(
    SELECT concat(firstname,' ',surname) AS member,
        name AS facility,
    CASE WHEN starttime::date='2012-09-14' THEN (
        CASE 
        WHEN memid=0 AND guestcost*slots>30 
            THEN guestcost*slots
        WHEN membercost*slots>30 
            THEN membercost*slots END
    ) END AS cost
    FROM cd.bookings
    JOIN cd.facilities
    USING(facid)
    JOIN cd.members
    USING(memid)
) AS t1
WHERE cost IS NOT NULL

