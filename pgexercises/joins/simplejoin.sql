/*
Retrieve the start times of members' bookings 
Question
How can you produce a list of the start times for bookings by members named 'David Farrell'?
*/
SELECT starttime
FROM cd.bookings
JOIN cd.members
USING (memid)
WHERE surname='Farrell' 
AND firstname='David'
