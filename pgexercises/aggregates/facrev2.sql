/*
Question
Produce a list of facilities with a total revenue less than 1000. Produce an output table consisting of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!
*/
SELECT *
FROM
(SELECT name,
    SUM(CASE WHEN memid=0 THEN slots*guestcost
        ELSE slots*membercost END) as cost
FROM cd.facilities
JOIN cd.bookings
USING(facid)
GROUP BY name
ORDER BY cost) a
WHERE cost<1000
