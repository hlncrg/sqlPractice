/*
Question
Produce a list of facilities along with their total revenue. The output table should consist of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!
*/
SELECT name, 
    SUM(CASE WHEN memid=0 THEN slots*guestcost 
        ELSE slots*membercost END) as cost
FROM cd.facilities
JOIN cd.bookings
USING(facid)
GROUP BY name
ORDER BY cost
