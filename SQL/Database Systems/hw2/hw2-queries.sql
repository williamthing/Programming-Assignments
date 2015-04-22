-- William Thing
-- CSE414 Homework 2

-- C.

-- 1. List the first and last names of all the actors who played in the movie 'Officer 444'.

SELECT a.fname as FirstName, a.lname LastName
FROM ACTOR a, MOVIE m, CASTS c
WHERE m.name = 'Officer 444' AND c.mid = m.id AND a.id = c.pid;

-- 2. List all the directors who directed a 'Film-Noir' movie in a leap year.

SELECT d.id as DIRECTORID, d.fname as FIRSTNAME, d.lname as LASTNAME, m.name as MOVIE, m.year as YEAR
FROM DIRECTORS d, MOVIE m, MOVIE_DIRECTORS md, GENRE g
WHERE g.mid = m.id AND m.id = md.mid AND g.genre = 'Film-Noir' AND d.id = md.did AND m.year % 4 = 0;

-- 3. List all the actors who acted in a film before 1900 and also in a film after 2000.

SELECT DISTINCT a.fname as FirstName, a.lname as LastName
FROM ACTOR a, MOVIE m1, MOVIE m2, CASTS c1, CASTS c2  
WHERE m1.year < 1900 AND m2.year > 2000 AND a.id = c1.pid AND c1.mid = m1.id AND a.id = c2.pid AND c2.mid = m2.id;

/*
The reason actors appear in movies more than 100 years apart is because the information for movie year is not
completely accurate, the movie and year given is time/setting that the movie takes place. I found this out by using a query
to find movies acted by William McKinley, then researched online the movie 'Unveiling of Grant Monument' and discovered
it was a documentary and the year the documentary took place.

SELECT DISTINCT a.fname as FirstName, a.lname as LastName, m1.name as Movie, m1.year as Year
FROM ACTOR a, MOVIE m1, MOVIE m2, CASTS c1, CASTS c2  
WHERE m1.year < 1900 AND m2.year > 2000 AND a.id = c1.pid AND c1.mid = m1.id AND a.id = c2.pid AND c2.mid = m2.id
AND a.fname = 'William' AND a.lname = 'McKinley';
*/

-- 4. List all directors who directed 500 movies or more, in descending order of the number of movies they directed. 
--	  Return the directors' names and the number of movies each of them directed.

SELECT d.fname as DirectorFirstName, d.lname as DirectorLastName, COUNT(*)
FROM DIRECTORS d, MOVIE_DIRECTORS md
WHERE d.id = md.did
GROUP BY d.id
HAVING COUNT(*) >= 500
ORDER BY COUNT(*) DESC;

-- 5. We want to find actors that played five or more roles in the same movie during the year 2010. Notice that 
--	  CASTS may have occasional duplicates, but we are not interested in these: we want actors that had five or 
--    more distinct roles in the same movie in the year 2010. Write a query that returns the actors' names, the 
--    movie name, and the number of distinct roles that they played in that movie.

SELECT a.fname, a.lname, m.name, COUNT(Distinct c.role)
FROM ACTOR a, CASTS c, MOVIE m
WHERE m.year = 2010 AND a.id = c.pid AND c.mid = m.id
GROUP BY a.id, m.id
HAVING COUNT(Distinct c.role) >= 5;




