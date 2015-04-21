-- William Thing
-- CSE414 HOMEWORK 2

-- B.

CREATE INDEX Actorid on ACTOR(id);				-- in order to speed up queries 1, 3, 5
CREATE INDEX Actorln on ACTOR(lname);			-- in order to speed up queries 1, 3, 5

CREATE INDEX MovieN on MOVIE(name);				-- in order to speed up queries 1, 2, 5
CREATE INDEX Movieid on MOVIE(id);				-- in order to speed up queries 2, 3, 5
CREATE INDEX MovieY on MOVIE(year);				-- in order to speed up queries 2, 5

CREATE INDEX Castmid on CASTS(mid);				-- in order to speed up queries 1, 3, 5
CREATE INDEX Castpid on CASTS(pid);				-- in order to speed up queries 1, 3, 5
CREATE INDEX Castrole on CASTS(role);			-- in order to speed up query 5

CREATE INDEX MDdid on MOVIE_DIRECTORS(did);		-- in order to speed up queries 2, 4
CREATE INDEX MDmid on MOVIE_DIRECTORS(mid);		-- in order to speed up query 5

CREATE INDEX Genremid on GENRE(mid);			-- in order to speed up query 2

-- 11 Indexes


