/*
Produce a list of all members, along with their recommender, using no joins. 
Question
How can you output a list of all members, including the individual who recommended them (if any), without using any joins? Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.
*/
SELECT DISTINCT concat(m1.firstname,' ',m1.surname) AS member,
CASE 
    WHEN m1.recommendedby IS NOT NULL
    THEN concat(m2.firstname,' ',m2.surname) 
    ELSE NULL END AS recommender
FROM cd.members AS m1, cd.members AS m2
WHERE m2.memid=m1.recommendedby OR m1.recommendedby IS NULL
ORDER BY member
--or
SELECT DISTINCT concat(m1.firstname,' ',m1.surname) AS member,
    (SELECT concat(m2.firstname,' ',m2.surname)
    FROM cd.members AS m2
    WHERE m2.memid=m1.recommendedby)
FROM cd.members AS m1
ORDER BY member
