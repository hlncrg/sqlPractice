/*
Combining results from multiple queries 
Question
You, for some reason, want a combined list of all surnames and all facility names. Yes, this is a contrived example :-). Produce that list!
*/
SELECT name AS surname
FROM cd.facilities
UNION
SELECT surname
FROM cd.members
