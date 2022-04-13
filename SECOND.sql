SHOW DATABASES;

USE ABHINAV;

CREATE TABLE STUDENTS (
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
EMAIL VARCHAR(20),
PHONE VARCHAR(20),
PRIMARY KEY (ID)
);

CREATE TABLE LIBRARY(
BID INT NOT NULL,
BNAME VARCHAR(20),
IDATE DATETIME DEFAULT NOW(),
ID INT NOT NULL,
PRIMARY KEY (BID),
FOREIGN KEY (ID) REFERENCES STUDENTS (ID)
);

INSERT INTO STUDENTS 
VALUES (1,'ABHINAV','ABHINAV@GMAIL.COM','87878787');


INSERT INTO STUDENTS 
VALUES (2,'AMAN','AMAN@GMAIL.COM','852125874');

INSERT INTO STUDENTS 
VALUES (3,'AKASH','AKASH@GMAIL.COM','741258963');

INSERT INTO STUDENTS 
VALUES (4,'GAURAV','GAURAV@GMAIL.COM','789456123');

SELECT * FROM STUDENTS;

ALTER TABLE LIBRARY
DROP COLUMN IDATE;

INSERT INTO LIBRARY
VALUES (101,'MATHS',1);

INSERT INTO LIBRARY
VALUES (102,'ENGLISH',1);

INSERT INTO LIBRARY
VALUES (103,'PHYSICS',1);

INSERT INTO LIBRARY
VALUES (104,'CHEMISTRY',1);

SELECT * FROM LIBRARY;

SELECT * FROM STUDENTS;

SELECT LIBRARY.BID , LIBRARY.BNAME , LIBRARY.ID , STUDENTS.NAME , STUDENTS.EMAIL
FROM LIBRARY
INNER JOIN STUDENTS
ON LIBRARY.ID = STUDENTS.ID;

CREATE TABLE ORDERS(
ID INT NOT NULL,
OID INT NOT NULL,
ONAME VARCHAR(50),
PRIMARY KEY (OID),
FOREIGN KEY (ID) references STUDENTS(ID)
);

INSERT INTO ORDERS
VALUES (1,1,'12AA12');

INSERT INTO ORDERS
VALUES (1,2,'12AA14'); 

SELECT * FROM STUDENTS;

SELECT * FROM ORDERS;


SELECT STUDENTS.NAME , STUDENTS.ID , ORDERS.ONAME
FROM ORDERS
INNER JOIN STUDENTS
ON STUDENTS.ID = ORDERS.ID
INNER JOIN LIBRARY
ON LIBRARY.ID = STUDENTS.ID;

SELECT * FROM LIBRARY;