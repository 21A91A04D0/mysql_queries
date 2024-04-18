CREATE DATABASE school;
CREATE DATABASE if not exists school;

DROP DATABASE school;

CREATE DATABASE college;

use college;

SHOW  DATABASES;

CREATE TABLE employees(
eid INT,
ename VARCHAR(50)
);

INSERT INTO employees(eid, ename)
VALUES(10, "siva"),
(20,"surya");

SELECT * FROM employees;

SHOW tables;  --  all the tables in a present data base


-- create a database for instagram

CREATE DATABASE IF NOT EXISTS instagramDb;
USE instagramDb; -- using this database i.e., instagramDb;

-- step3:- create table into the database

CREATE TABLE IF NOT EXISTS users(
userId INT PRIMARY KEY,
userName VARCHAR(50),
email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS posts(
postId INT PRIMARY KEY,
userId INT,
caption VARCHAR(100)
);
-- step - 4: insert values into the table
INSERT INTO users(userId, userName, email)
VALUES
(1, "riti", "abc@gmail.com"),
(2, "raj", "123#gmail.com"),
(3, "rahul", "a@gmail.com");


INSERT INTO posts(postId, userId, caption)
VALUES
(10, 101, "hello"),
(20, 201, "hai"),
(30, 301, "Bye");

USE instagramDb;

SHOW TABLES;

SELECT * FROM users;

SELECT * FROM posts;


-- CONSTRAINTS

USE INSTAGRAMDB;

-- UNIQUE CONSTRAINTS;

USE college;

create table student(
phonenbr INT UNIQUE
);

INSERT INTO student(phonenbr)
VALUES(12),
(22);


-- NOT NULL CONSTRAINT

create table student1(
age INT,
rollno INT NOT NULL
);

INSERT INTO student1(age)
VALUES(11);

-- check constrant

create table student2(
age INT CHECK(age > 18)
);

INSERT INTO student2(age)
VALUES(19);

-- Default contraint

create table student3(
schoolName varchar(50) default 'xyz',
age INT
);

INSERT INTO student3(age)
VALUES(30);

select * from student3;


-- primary key constraint

CREATE TABLE student4(
age INT,
rollno INT PRIMARY KEY
);

 -- unique
INSERT INTO student4(age, rollno)
VALUES(12, 1),
(13, 2),
(14, 2);

-- primary key can not be null
INSERT INTO student4(age)
VALUES(4);

-- foreign key constraint;

CREATE TABLE course(
courseName varchar(50),
rollno INT ,
FOREIGN KEY (rollno) REFERENCES student4(rollno)
);

-- make a database for all sql commands

CREATE DATABASE xyz;

use xyz;

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
age INT, 
department VARCHAR(50),
city varchar(50),
salary INT
);

INSERT INTO employee(id,name,age,department,city,salary)
VALUES
(1,"rahul", 25 ,"IT","Mumbai", 1500),

(2,"afsara" , 26 ,"HR" ,"Pune", 2000),

(3,"abhimanyu", 27 ,"IT","Mumbai", 2500),

(4,"aditya", 25 , "Marketing","Surat", 2400),

(5,"raj", 24,"Finance","Indore", 1500);




-- UPDATE COMMAND

UPDATE EMPLOYEE
SET salary = 50000
WHERE department = "HR";

SET SQL_SAFE_UPDATES=0;

UPDATE EMPLOYEE
SET name = "raaj"
WHERE name = "raj";

-- DELETE COMMAND

DELETE FROM EMPLOYEE
WHERE department = "HR";

DELETE FROM EMPLOYEE WHERE name = "raaj";

SELECT ID, NAme, age FROM employee;


-- Where clause
SELECT * FROM EMPLOYEE
WHERE age > 25;


-- alter command
ALTER TABLE employee
ADD dob VARCHAR(20) DEFAULT "np";

ALTER TABLE employee
DROP COLUMN dob;

-- modify in alter
ALTER TABLE employee
MODIFY age VARCHAR(3);


ALTER TABLE employee
CHANGE age emp_age VARCHAR(3);

ALTER TABLE employee
RENAME COLUMN emp_age TO age;

--  Renaming a table
RENAME TABLE employee TO employees;
SELECT * FROM EMPLOYEES;

RENAME TABLE employees TO employee;
SELECT * FROM EMPLOYEE;

CREATE TABLE salarydetails(
salary int,
increment int);

INSERT INTO salarydetails(salary, increment)
VALUES(100,600),
(200, 700),
(100,600);
select * from salarydetails;

TRUNCATE TABLE SALARYDETAILS;

TRUNCATE TABLE employee;

-- Distinct to retrieve unique values
SELECT DISTINCT department, age FROM employee;

-- AND operator
USE XYZ;

SELECT * FROM EMPLOYEE WHERE DEPARTMENT = 'IT' AND AGE > 18;
-- OR operator
SELECT * FROM EMPLOYEE WHERE DEPARTMENT = 'IT' OR AGE > 18;

-- NOT operator
SELECT * FROM EMPLOYEE WHERE DEPARTMENT NOT IN('IT','HR');

-- IN OPerator
SELECT * FROM EMPLOYEE WHERE DEPARTMENT IN('IT','HR');

-- NULL operator
SELECT * FROM EMPLOYEE WHERE DEPARTMENT IS NULL;

SELECT * FROM EMPLOYEE WHERE DEPARTMENT IS NOT NULL;

-- LIKE operator
SELECT * FROM EMPLOYEE WHERE name LIKE 'A%';

--  UNDERSCORE operator
SELECT * FROM EMPLOYEE WHERE name LIKE '_A%';

-- BETWEEN operator

SELECT * FROM employee WHERE salary BETWEEN 1500 AND 2000;

-- Aggregation functions 

-- COUNT()
use xyz;
SELECT count(name) From employee WHERE department = "IT";

-- SUM()
SELECT SUM(salary) FROM employee;

-- AVG()
SELECT AVG(salary) FROM employee;

-- MIN()
SELECT MIN(salary) FROM employee;

-- MAX()
SELECT MAX(salary) FROM EMPLOYEE;

-- clauses

-- limit clause
use xyz;

SELECT * FROM employee LIMIT 2;

-- order by

SELECT * FROM employee ORDER BY salary DESC;

SELECT * FROM employee ORDER BY salary ASC;

-- group by clause

SELECT department, AVG(salary) AS avgsal
FROM employee
GROUP BY department;

-- Having clause

SELECT department, AVG(salary) AS avgsal
FROM EMPLOYEE 
GROUP BY department
HAVING avgsal >= 1500;

use xyz;
select * from employee;

-- practice questions
-- write a query to find the no of total number of employee in each city

select city, count(name) as no_of_emp
from employee
group by city;

-- write a query to find the maximum salary of employees in each city in descending order
select city, max(salary) as max_salary 
from employee
group by city 
order by max_salary desc;

-- write a query to display the department name alongside the total count of employees in each department 
-- sorting the results by the total number of employees in descending order.
select department, count(id) as no_of_emp
from employee
group by department
order by no_of_emp desc;

-- write a query list a departments where the average salary is greater than 1200, also display the department 
-- name and the average salary;
select department, avg(salary) as avg_salary
from employee 
group by department
having avg_salary > 1200;




