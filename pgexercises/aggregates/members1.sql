/*
Question
Find the total number of members who have made at least one booking.
*/
SELECT COUNT(DISTINCT memid)
FROM cd.bookings
JOIN cd.members
USING(memid)

