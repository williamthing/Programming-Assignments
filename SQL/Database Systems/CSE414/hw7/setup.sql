-- William Thing
-- CSE414
-- Homework 7

CREATE TABLE RentalPlan(
  pid INT PRIMARY KEY,
  pname VARCHAR(50) UNIQUE NOT NULL,
  max_rental INT,
  monthly_fee smallmoney);

CREATE TABLE Customer(
  cid INT PRIMARY KEY,
  login VARCHAR(50),
  password VARCHAR(50),
  fname VARCHAR(50),
  lname VARCHAR(50),
  pid INT REFERENCES RentalPlan(pid));

CREATE TABLE Rental(
  cid INT REFERENCES Customer(cid),
  mid INT,
  date_and_time DATETIME NOT NULL,
  status VARCHAR(6) CHECK(status = 'closed' or status = 'open'));

CREATE CLUSTERED INDEX rentalIdx on Rental(mid);

INSERT INTO RentalPlan VALUES(1, 'Basic', 1, 5.99);
INSERT INTO RentalPlan VALUES(2, 'Rental Plus', 5, 14.99);
INSERT INTO RentalPlan VALUES(3, 'Rental Star', 10, 19.99);
INSERT INTO RentalPlan VALUES(4, 'Rental King', 20, 24.99);

INSERT INTO Customer VALUES(1, 'ccheese', 'cheeze', 'Chucky', 'Cheese', 2);
INSERT INTO Customer VALUES(2, 'tlee', 'ticktock', 'Tom', 'Lee', 3);
INSERT INTO Customer VALUES(3, 'mchang', 'abc1010', 'Michael', 'Chang', 4);
INSERT INTO Customer VALUES(4, 'jwu', 'jwu2020', 'Jordan', 'Wu', 1);
INSERT INTO Customer VALUES(5, 'sgo', 'S2010g', 'Sandra', 'Go', 4);

INSERT INTO Rental VALUES(3, 11111111, '2015-02-28 12:18:20', 'closed');
INSERT INTO Rental VALUES(1, 12442198, '2015-03-01 12:35:30', 'open');
INSERT INTO Rental VALUES(2, 11223344, '2015-04-14 11:20:34', 'open');
INSERT INTO Rental VALUES(3, 12345678, '2015-03-14 20:18:10', 'closed');