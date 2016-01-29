/*
Question
Produce a list of the total number of slots booked per facility per month in the year of 2012. Produce an output table consisting of facility id and slots, sorted by the id and month.
*/
SELECT facid, EXTRACT(month FROM starttime) as m,
    SUM(slots)
FROM cd.bookings
WHERE EXTRACT(year FROM starttime)='2012'
GROUP BY m, facid
ORDER BY facid, m
