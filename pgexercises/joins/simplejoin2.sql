/*
Work out the start times of bookings for tennis courts 
Question
How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
*/
SELECT starttime, name
FROM cd.bookings
JOIN cd.facilities
USING(facid)
WHERE name LIKE 'Tennis Court%'
AND starttime::date='2012-09-21'
ORDER BY starttime
--this also works
SELECT starttime, name
FROM cd.bookings
JOIN cd.facilities
USING(facid)
WHERE name LIKE 'Tennis Court%'
AND starttime>='2012-09-21'
AND starttime<'2012-09-22'
ORDER BY starttime
