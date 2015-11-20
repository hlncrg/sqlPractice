/*
Matching against multiple possible values
Question
How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
*/
SELECT * 
FROM cd.facilities
WHERE facid<=5
AND facid!=2
AND facid!=3
AND facid!=4
AND facid>0;
--or
SELECT * 
FROM cd.facilities
WHERE facid=1
UNION
SELECT * 
FROM cd.facilities
WHERE facid=5
--or
SELECT * 
FROM cd.facilities
WHERE facid IN (1,5)
