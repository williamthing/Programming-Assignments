-- William Thing
-- CSE414
-- Homework 1

.header on
.nullvalue NULL
.mode column

----------------------------------------------------------------------------
-- Problem 1.

-- a.
create table R(A int, B int);

-- b.
insert into R values (2, 4);
insert into R values (1, 1);
insert into R values (3, 2);

-- c.
select *
from R;

-- d.
insert into R values ('5', '2');
-- No error, because sqlite3 type casted it into int

-- e.
select A
from R;

-- f.
select *
from R
where A <= B;

----------------------------------------------------------------------------
-- Problem 2.

create table MyRestaurants
(Name varchar(20), Type_of_food varchar(10), Distance int, Date_of_last_visit varchar(10),
Whether_like_or_not int);

----------------------------------------------------------------------------
-- Problem 3.

insert into MyRestaurants values ('Chipotle', 'mexican', 3, '2015-04-02', NULL);
insert into MyRestaurants values ('Than Brothers', 'pho', 1, '2015-04-03', 1);
insert into MyRestaurants values ('Sushi Land', 'japanese', 10, '2015-02-20', 1);
insert into MyRestaurants values ('Subway', 'sandwiches', 15, '2015-03-25', 0);
insert into MyRestaurants values ('NoodleZone', 'noodles', 5, '2014-12-20', 1);

----------------------------------------------------------------------------
-- Problem 4.

select Name from MyRestaurants;

----------------------------------------------------------------------------
-- Problem 5.

-- a.
.separator ","
.mode list
select * from MyRestaurants;

-- b.
.separator "|"
.mode list
select * from MyRestaurants;

-- c.
.mode column
.width 15 15 15 15 15
select * from MyRestaurants;

-- d.
 -- header on
.headers on

.separator ","
.mode list
select * from MyRestaurants;

.separator "|"
.mode list
select * from MyRestaurants;

.mode column
.width 15 15 15 15 15
select * from MyRestaurants;

 -- header off
.headers off

.separator ","
.mode list
select * from MyRestaurants;

.separator "|"
.mode list
select * from MyRestaurants;

.mode column
.width 15 15 15 15 15
select * from MyRestaurants;


----------------------------------------------------------------------------
-- Problem 6.

SELECT CASE Whether_like_or_not
WHEN 1 THEN 'I like it'
WHEN 0 THEN 'I hate it'
ELSE NULL
END
from MyRestaurants;

/* Another way of doing the CASE STATEMENT
SELECT Name, CASE
WHEN Whether_like_or_not = 1 THEN'I like it'
WHEN Whether_like_or_not = 0 THEN'I hate it'
ELSE NULL
END
from MyRestaurants;
*/

----------------------------------------------------------------------------
-- Problem 7.

SELECT Name
from MyRestaurants
where Whether_like_or_not = 1 and date(Date_of_last_visit) < date('now', '-3 month');

