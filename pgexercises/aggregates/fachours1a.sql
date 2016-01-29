/*
Question
Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and hours, sorted by facility id.
*/
SELECT *
FROM
(SELECT facid, SUM(slots) s
FROM cd.bookings
GROUP BY facid) a
WHERE s>1000
ORDER BY facid
--or
SELECT facid, SUM(slots) s
FROM cd.bookings
GROUP BY facid
HAVING(SUM(slots))>1000
ORDER BY facid
