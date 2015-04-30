-- Used for testing purposes for assignment 4

CREATE TABLE Employee(eid int, name varchar(20), office varchar(20));
CREATE TABLE Manager(eid int, mid int);
INSERT INTO Employee(eid, name, office) VALUES (1, 'Alice', 'Tech');
INSERT INTO Employee(eid, name, office) VALUES (2, 'Alice', 'Google');
INSERT INTO Employee(eid, name, office) VALUES (3, 'Bob', 'Foreign');
INSERT INTO Employee(eid, name, office) VALUES (4, 'William', 'Diff');
INSERT INTO Employee(eid, name, office) VALUES (5, 'Jimmy', 'Weird');
INSERT INTO Employee(eid, name, office) VALUES (6, 'Timmy', 'Google');
INSERT INTO Manager(eid, mid) VALUES (1,5);
INSERT INTO Manager(eid, mid) VALUES (1,6);
INSERT INTO Manager(eid, mid) VALUES (2,6);