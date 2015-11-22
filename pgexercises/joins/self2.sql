/*
Produce a list of all members, along with their recommender
Question
How can you output a list of all members, including the individual who recommended them (if any)? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
*/
SELECT DISTINCT m2.firstname memfname, m2.surname memsname, 
    m1.firstname recfname, m1.surname recsname
FROM cd.members m1
RIGHT JOIN cd.members m2
ON m1.memid=m2.recommendedby
ORDER BY memsname, memfname
