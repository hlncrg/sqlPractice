/*
Simple aggregation 
Question
You'd like to get the signup date of your last member. How can you retrieve this information?
*/
SELECT max(joindate) AS latest
FROM cd.members
--or
SELECT joindate AS latest
FROM cd.members
ORDER BY joindate DESC
LIMIT 1
