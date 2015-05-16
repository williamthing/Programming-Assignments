-- 	William Thing
--	CSE414
--	Homework 3

-- A. Completed
-- B. SQL QUERIES


-- Question 1
-- List actors first name and last name with 5 or more rows in a movie
-- Results 137 tuples 

SELECT a.fname 'First Name', a.lname 'Last Name', c.role 'Role', m.name 'Movie'
FROM Actor a, Movie m, Casts c, 
	(SELECT a.id AS thisActor, m.name AS thisMovie
	FROM Actor a, Movie m, Casts c
	WHERE m.year = 2010 AND a.id = c.pid AND c.mid = m.id
	GROUP BY a.id, m.name
	HAVING COUNT(*) >= 5) x
WHERE a.id = c.pid and m.id = c.mid
AND x.thisActor = a.id and x.thisMovie = m.name;

/*
Check for correct amount of tuples. The count is 137 tuples.

Select COUNT(*) AS Count
from (SELECT a.fname 'First Name', a.lname 'Last Name', c.role 'Role', m.name 'Movie'
FROM Actor a, Movie m, Casts c, 
 (SELECT a.id AS thisActor, m.name AS thisMovie
 FROM Actor a, Movie m, Casts c
 WHERE m.year = 2010 AND a.id = c.pid AND c.mid = m.id 
 GROUP BY a.id, m.name
 HAVING COUNT(*) >= 5) x
WHERE a.id = c.pid and m.id = c.mid
AND x.thisActor = a.id and x.thisMovie = m.name) r;
*/

-- Question 2
-- Gives the count of movies that only have female actors by year
-- Year is listed by ascending order
-- Results to 129 tuples

SELECT m.year AS Year, COUNT(*) AS 'The number of Movies'
FROM MOVIE m
WHERE m.id NOT IN 
	(SELECT c.mid
	FROM CASTS c
 	INNER JOIN ACTOR a ON a.id = c.pid
 	WHERE a.gender = 'm') 
GROUP BY m.year
ORDER BY m.year ASC;

/*
Check for correct amount of tuples. The count comes out to 129 tuples.

SELECT COUNT(*) FROM (SELECT m.year AS Year, COUNT(*) AS 'The number of Movies'
FROM MOVIE m
WHERE m.id NOT IN 
 (SELECT c.mid
 FROM CASTS c
  INNER JOIN ACTOR a ON a.id = c.pid
  WHERE a.gender = 'm') 
 GROUP BY m.year) r;
*/

-- Question 3
-- Joins commonality between years and then creates a table of tuples with attributes of
-- common years, percentage of female only movies, and number of all movies.
-- 128 Tuples as results

SELECT x.year AS Year, ((x.femaleMovies * 100.0) / y.allMov) AS Percentage, y.allMov AS 'Total Movies'
FROM 
	(SELECT m.year AS Year, COUNT(*) AS femaleMovies
	FROM MOVIE m
	WHERE m.id NOT IN 
		(SELECT c.mid
		FROM CASTS c
 		INNER JOIN ACTOR a ON a.id = c.pid
 		WHERE a.gender = 'm') 
	GROUP BY m.year) x INNER JOIN
	(SELECT m.year AS YEAR, COUNT(*) allMov
	FROM MOVIE as m
	GROUP BY m.year) y ON x.year = y.year;

/*
Count check

SELECT COUNT(*) AS 'Number of Result'
FROM (SELECT x.year AS Year, ((x.femaleMovies * 100.0) / y.allMov) AS Percentage, y.allMov AS 'Total Movies'
FROM 
 (SELECT m.year AS Year, COUNT(*) AS femaleMovies
 FROM MOVIE m
 WHERE m.id NOT IN 
  (SELECT c.mid
  FROM CASTS c
   INNER JOIN ACTOR a ON a.id = c.pid
   WHERE a.gender = 'm') 
 GROUP BY m.year) x INNER JOIN
 (SELECT m.year AS YEAR, COUNT(*) allMov
 FROM MOVIE as m
 GROUP BY m.year) y ON x.year = y.year) r;
*/

-- Question 4
-- Result:
-- 1 Tuple; the movie: Around the World in Eighty Days with Cast size of 1298

SELECT TOP 1 x.MOVIE AS MOVIENAME, x.CASTSIZE
FROM (SELECT m.name AS MOVIE, COUNT(DISTINCT c.pid) AS CASTSIZE
FROM MOVIE m, CASTS c
WHERE m.id = c.mid
GROUP BY m.id, m.name) x
ORDER BY x.CASTSIZE DESC;

-- Question 5
-- Result:
-- 1 Tuple; DECADE is 2000-2009 with the number of movies that decade, which is 457,481

SELECT TOP 1 (m.year/10*10) AS DECADE, COUNT(*) AS 'MOVIE COUNT'
FROM Movie m
GROUP BY (m.year/10*10)
ORDER BY 'MOVIE COUNT' DESC;

-- Question 6
-- Result:
-- 1 Tuple; 521,876 Actors are Bacon Number of 2 Actors

SELECT COUNT(DISTINCT c.pid) AS 'Count of Bacon Number 2 Actors'
FROM Casts c 
WHERE c.mid IN (
    SELECT c.mid 
    FROM Casts c 
    WHERE c.pid IN
        (SELECT DISTINCT c.pid 
        FROM Casts c 
        WHERE c.mid IN
            (SELECT c.mid 
            FROM Actor a, Casts c 
            WHERE c.pid = a.id 
            AND a.fname = 'Kevin' and a.lname = 'Bacon'
            ))) AND c.pid NOT IN 
				(SELECT DISTINCT c.pid 
 				FROM Casts c
    			WHERE c.mid IN
        			(SELECT c.mid 
        			FROM Actor a, Casts c 
        			WHERE c.pid = a.id AND a.fname = 'Kevin' AND a.lname = 'Bacon'));

-- C.
-- This was my first time using a DBMS cloud service, and I really enjoyed it. Running
-- queries were easy and quick, and the user interface was friendly as well as informative
-- because you were able to see where all your resources were going into in the query.
-- I think the idea of offering a DBMS 
-- is good because it allows many users to share and have access to one or more databases.
-- This is hosted somewhere in one of Microsoft's data centers, so anyone can access the
-- same database at anytime without using a specific computer because it is in the 'cloud'.




