/*
Produce a list of all members who have recommended another member
Question
How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
*/
SELECT DISTINCT m1.firstname, m1.surname
FROM cd.members m1
JOIN cd.members m2
ON m1.memid=m2.recommendedby
ORDER BY m1.surname, m1.firstname
