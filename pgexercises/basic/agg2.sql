/*
More aggregation 
Question
You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?
*/
SELECT firstname, surname, joindate 
FROM cd.members
JOIN 
(
  SELECT max(joindate) as maxjoin
  FROM cd.members
  ) as maxjoin
 ON cd.members.joindate=maxjoin.maxjoin
--or
SELECT firstname, surname, joindate 
FROM cd.members
WHERE joindate IN 
(
  SELECT max(joindate) as maxjoin
  FROM cd.members
  ) 
--or 
FROM 
(SELECT firstname, surname, (
  SELECT max(joindate) 
  FROM cd.members
  ) AS maxjoin,
 joindate
FROM cd.members) AS m1
WHERE joindate=maxjoin
--or
SELECT firstname, surname, joindate 
FROM cd.members
ORDER BY joindate DESC
LIMIT 1
--I am sure there are others =)
