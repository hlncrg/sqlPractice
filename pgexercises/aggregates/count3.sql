/*
Count the number of recommendations each member makes. 
Question
Produce a count of the number of recommendations each member has made. Order by member ID.
*/
SELECT recommendedby, COUNT(recommendedby)
FROM cd.members
WHERE recommendedby IS NOT NULL
GROUP BY recommendedby
ORDER BY recommendedby
