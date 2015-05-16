-- William Thing
-- CSE414 Homework 2
-- SQL

.header on
.mode column
-- A.
-- creating tables
CREATE TABLE ACTOR(id int, fname varchar(30), lname varchar(30), gender varchar(1), PRIMARY KEY (id));
CREATE TABLE MOVIE(id int, name varchar(150), year int, PRIMARY KEY (id));
CREATE TABLE DIRECTORS(id int, fname varchar(30), lname varchar(30), PRIMARY KEY (id));
CREATE TABLE CASTS(pid int, mid int, role varchar(50), FOREIGN KEY(pid) REFERENCES ACTOR(id), FOREIGN KEY(mid) REFERENCES MOVIE(id));
CREATE TABLE MOVIE_DIRECTORS(did int, mid int, FOREIGN KEY(mid) REFERENCES MOVIE(id), FOREIGN KEY(did) REFERENCES DIRECTORS(id));
CREATE TABLE GENRE(mid int, genre varchar(50));

-- turn foreign keys on
PRAGMA foreign_keys=ON;

-- import into tables
.import imdb2010/actor.txt ACTOR
.import imdb2010/movie.txt MOVIE
.import imdb2010/directors.txt DIRECTORS
.import imdb2010/casts.txt CASTS
.import imdb2010/movie_directors.txt MOVIE_DIRECTORS
.import imdb2010/genre.txt GENRE





