-- B17 Practice

USE student;

DELETE FROM student_details
WHERE student_id=2;

SELECT * FROM student_details;

ALTER TABLE student_details
ADD Email VARCHAR(50);

ALTER TABLE student_details
ADD mail VARCHAR(50),
ADD marks INT;

ALTER TABLE student_details
MODIFY mail INT;

ALTER TABLE student_details
MODIFY Email VARCHAR(45);

ALTER TABLE student_details
RENAME COLUMN mail TO Gmail;

ALTER TABLE student_details
RENAME TO Vinsup;

ALTER TABLE Vinsup
RENAME TO student_details;

ALTER TABLE student_details
DROP COLUMN Gmail;

CREATE TABLE sample(Name INT);

DROP TABLE sample;

CREATE DATABASE sample;

DROP DATABASE sample;

TRUNCATE TABLE student_details;

SELECT * FROM student_details;
ALTER TABLE student_details
DROP COLUMN Email,
DROP COLUMN marks;

INSERT INTO student_details
VALUES
(1,'Rahul',20,'A+'),
(2,'Priya',21,'B'),
(3,'Kumar',22,'A');

INSERT INTO student_details (student_id, name)
VALUES (4,'Ravi');

SELECT * FROM student_details;

UPDATE student_details
SET age=20, grade='A+'
WHERE student_id=4;

SELECT name,age,grade, age+5 AS AgeAfter5Years
FROM student_details;

SELECT * FROM sales_database
WHERE Quantity>=10;

SELECT * FROM sales_database
WHERE Quantity>=10 AND Segment='Consumer';

SELECT * FROM sales_database
WHERE Quantity>=10 OR Segment='Consumer' OR Category='Furniture';

SELECT * FROM sales_database
WHERE Segment='Home Appliances' OR Segment='Consumer' OR Segment='Home';

SELECT * FROM sales_database
WHERE Segment IN ('Home Appliances', 'Consumer','Home');

SELECT * FROM sales_database
WHERE City IN ('New York City', 'Los Angeles','Columbia');

SELECT * FROM sales_database
WHERE Quantity>=10 AND Quantity<=15;

SELECT * FROM sales_database
WHERE Quantity BETWEEN 10 AND 15;

SELECT * FROM sales_database
WHERE Customer_Name LIKE '%S';

SELECT * FROM sales_database
WHERE Customer_Name LIKE '%S' OR Customer_Name LIKE '%R';

SELECT * FROM sales_database
ORDER BY Category ASC, Sub_Category ASC;

SELECT DISTINCT City
FROM sales_database;

SELECT DISTINCT Segment,Category
FROM sales_database;

-- SQL Day 3
USE youtube;

-- 22. Display all cars sorted by price in ascending order
SELECT * FROM car_prices
ORDER BY price;

-- 23. Display all cars sorted by price in descending order.
SELECT * FROM car_prices
ORDER BY price DESC;

-- 24. Display all cars sorted by mileage in descending order.
SELECT * FROM car_prices
ORDER BY mileage DESC;

-- 28. List all distinct car colors available in the table
SELECT DISTINCT color FROM car_prices;

-- 29. List all distinct states available in the table.
SELECT DISTINCT state FROM car_prices;

-- 30. Display the top 5 most expensive cars 
SELECT * FROM car_prices
ORDER BY price DESC LIMIT 5;

-- --------------------------
USE student;

SELECT COUNT(*) AS No_of_entries FROM student_details;

SELECT * FROM student_details;

SELECT COUNT(grade) AS No_of_entries FROM student_details;

SELECT MAX(age) AS Maximum_Age FROM student_details;

SELECT MIN(age) AS Manimum_Age FROM student_details;

SELECT SUM(age) AS  Total_Age FROM student_details;

SELECT AVG(age) AS Average_Age FROM student_details;

USE academy;
SELECT * FROM vinsup;

-- No. of Customers available in the table
SELECT COUNT(DISTINCT Customer_Name) FROM vinsup;

-- Find out the total quantities sold in office supplies category
SELECT SUM(Quantity) FROM vinsup WHERE Category='Office Supplies';

USE youtube;
-- 18. Find the highest car price
SELECT MAX(price) AS Highest_Price FROM car_prices;

-- 19. Find the lowest car price.
SELECT MIN(price) AS Lowest_Price FROM car_prices;

-- 20. Find the average car price.
SELECT AVG(price) AS Average_Price FROM car_prices;

-- 21. Find the average mileage of all cars.
SELECT AVG(mileage) AS Average_Mileage FROM car_prices;

SELECT model, AVG(mileage) AS Average_Mileage 
FROM car_prices 
GROUP BY model;

-- 25. Count how many cars belong to each make
SELECT make, COUNT(*) AS No_of_cars FROM car_prices GROUP BY make; 

-- 26. Find the average price of cars for each make
SELECT make, AVG(price) AS Average_Price FROM car_prices GROUP BY make; 

-- 27. Find the number of cars available in each state.
SELECT state, COUNT(*) AS No_of_cars FROM car_prices GROUP BY state; 


-- Concatenate make and model column using - as delimirter
SELECT CONCAT(make,'-',model) AS MAKE_MODEL FROM car_prices;

-- count the model length
SELECT model, LENGTH(model) AS Model_length FROM car_prices;

-- Convert the make column to upper and model column to lower case
SELECT UPPER(make) AS Make, LOWER(model) AS Model FROM car_prices;

-- change the name column in student_details table to lower case in the database
USE student;
UPDATE student_details
SET name=LOWER(name);

SET SQL_SAFE_UPDATES=0;

SELECT * FROM student_details;


-- 
USE youtube;
SELECT * FROM car_prices;

-- Replace red to black
SELECT color, REPLACE(color,'red','black') FROM car_prices;

-- Replace red to black for those car prices are above 30k
SELECT color, price, REPLACE(color,'red','black') FROM car_prices WHERE price>30000;
/*
Q1. Apply in make Column:
First 2 characters - Upper case
Last 2 characters - Upper case
In between - 4th position- upper case
To USE:
UPPER ()
LOWER ()
RIGHT ()
LEFT ()
SUBSTRING ()
CONCAT ()*/

SELECT make,
CONCAT(
UPPER(LEFT(make,2)),
LOWER(SUBSTRING(make,3,1)),
UPPER(SUBSTRING(make,4,1)),
LOWER(SUBSTRING(make,5,LENGTH(make)-6)),
UPPER(RIGHT(make,2))) AS changed_make
FROM car_prices;


/* Display customer name whose sale value is above >=5000 as "Gold Member", 
2000 to 4999 as "Silver Member", less than 2000 "Bronze member".*/
USE academy;
SELECT Customer_Name, Sales, 
CASE
	WHEN Sales>=5000 THEN 'Gold Member'
    WHEN Sales>=2000 THEN 'Silver Member'
    ELSE 'Bronze Member'
    END AS MemberShip_Batch
FROM vinsup;

select * from vinsup;

-- What if the search word not found?
SELECT City, INSTR(City,'York') FROM vinsup;

-- GROUP BY & HAVING
Use youtube;
SELECT model, AVG(mileage) AS Average_Mileage 
FROM car_prices 
GROUP BY model
HAVING model='Cruze';


-- Day 4 - Joins 

USE student;

CREATE TABLE Students_Table(
student_id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE Marks_Table(
student_id INT PRIMARY KEY,
subject VARCHAR(50),
marks VARCHAR(50)
);

INSERT INTO Students_Table
VALUES (1,'Anu'),(2,'Ravi'),(3,'Devi');

INSERT INTO Marks_Table
VALUES (1,'Math',85),(2,'Science',78),(4,'English',90);

ALTER TABLE Marks_table
MODIFY COLUMN marks INT;

-- Inner join
SELECT students_table.student_id, students_table.name, marks_table.subject, marks_table.marks
FROM students_table
INNER JOIN marks_table
ON students_table.student_id=marks_table.student_id;

SELECT s.student_id, s.name, m.subject, m.marks
FROM students_table s
INNER JOIN marks_table m
ON s.student_id=m.student_id;

-- Left Join
SELECT s.student_id,m.student_id, s.name, m.subject, m.marks
FROM students_table s
LEFT JOIN marks_table m
ON s.student_id=m.student_id;

-- Right Join
SELECT s.student_id,m.student_id, s.name, m.subject, m.marks
FROM students_table s
RIGHT JOIN marks_table m
ON s.student_id=m.student_id;

-- Question From capstone - Display all the customer details ven if they have no orders placed.alter
SELECT c.customer_id, c.first_name, c.last_name, o.order_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- UNION
SELECT s.student_id, s.name, m.subject, m.marks
FROM Students_Table s
LEFT JOIN Marks_Table m
ON s.student_id = m.student_id

UNION

SELECT m.student_id, s.name, m.subject, m.marks
FROM Students_Table s
RIGHT JOIN Marks_Table m
ON s.student_id = m.student_id;

-- INTERSECT
SELECT s.student_id, s.name, m.subject, m.marks
FROM Students_Table s
LEFT JOIN Marks_Table m
ON s.student_id = m.student_id

INTERSECT -- Just an editor warning, no issue

SELECT s.student_id, s.name, m.subject, m.marks
FROM Students_Table s
RIGHT JOIN Marks_Table m
ON s.student_id = m.student_id;

-- EXCEPT
SELECT s.student_id, s.name, m.subject, m.marks
FROM Students_Table s
LEFT JOIN Marks_Table m
ON s.student_id = m.student_id

EXCEPT -- Just an editor warning, no issue

SELECT s.student_id, s.name, m.subject, m.marks
FROM Students_Table s
RIGHT JOIN Marks_Table m
ON s.student_id = m.student_id;


-- Day 5 Subqueries & Windows
-- Using from clause
USE student;

SELECT student_id, marks, avg_marks
FROM 
	(SELECT student_id, marks, AVG(marks) as avg_marks
	FROM marks_table GROUP BY student_id) AS cls_avg_marks
WHERE avg_marks>85;
