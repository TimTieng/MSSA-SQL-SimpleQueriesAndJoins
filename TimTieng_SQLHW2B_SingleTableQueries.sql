/*
Class:        ISTA 420 SQL and Application Development
Student:      Tim Tieng
Instructor:   Christine Lee
Date:         07/10/2020
Description:  Exercise 2B- SQL Single Table Queries Homework  (Exercise 1-8, page 93)
Revised:      Added Exerices 2-5
Revised by:   
Revision:     Completed up to Exercises 5. still working on 6-9
*/
--Exercise 1 Page 93 T-SQL
USE TSQLV4;
SELECT 
    orderid,
    orderdate,
    custid,
    empid
FROM Sales.Orders
WHERE orderdate BETWEEN '2015-06-01' AND '2015-06-30'
ORDER BY orderdate ASC;
--Exercise 2 Page 94 T-SQL
USE TSQLV4;
SELECT 
    orderid,
    orderdate,
    custid,
    empid
FROM Sales.Orders
WHERE orderdate = EOMONTH(orderdate)
ORDER BY orderdate ASC;
--Exercise 3 pg 94 T-SQL
USE TSQLV4;
SELECT 
    empid,
    firstname, 
    lastname
FROM HR.Employees
WHERE lastname LIKE '%e%e%';
--Exercise 4 pg 94 T-SQL
USE TSQLV4;
SELECT 
    orderid,
    SUM(qty*unitprice) AS totalvalue
FROM Sales.OrderDetails
GROUP BY orderid
HAVING SUM(qty * unitprice) > 10000
ORDER BY totalvalue DESC;
--Exercise 5 pg 95
USE TSQLV4;
SELECT
    empid,
    lastname
FROM HR.Employees
WHERE lastname COLLATE Latin1_General_CS_AS LIKE N'[abcdefghijklmnopqrstuvwxyz]%';
--Exercise 6 pg95.
USE TSQLV4;
SELECT
    empid,
    COUNT(*) AS numorders
FROM Sales.Orders 
WHERE orderdate < '20160501'
GROUP BY empid;

USE TSQLV4;
SELECT
    empid,
    COUNT(*) AS numorders
FROM Sales.Orders 
WHERE orderdate < '20160501'
GROUP BY empid
HAVING MAX(orderdate) < '20160501';
-- Exercise 7
USE TSQLV4
SELECT
    shipcountry,
    AVG(freight) AS avgFreight
FROM Sales.Orders 
WHERE orderdate >= '20150101' AND orderdate < '20160601'
GROUP BY shipcountry
ORDER BY avgFreight DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;
--Exercise 8 , 
USE TSQLV4;
SELECT
    custid,
    orderdate,
    orderid,
    ROW_NUMBER() OVER(PARTITION BY custid ORDER BY orderdate, orderid) AS rownum
FROM Sales.Orders
ORDER BY custid, rownum;
