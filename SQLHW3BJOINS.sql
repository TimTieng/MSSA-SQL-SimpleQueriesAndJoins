/*
Class: ISTA 420 - SQL and Application Development
Student: Tim Tieng
Instructor: Christine Lee
Date: 25JUL2020
Description - HW 3B JOINS
Revised By:
Revised On:
Revisions Made:
*/
--Query 1 
USE TSQLV4;
SELECT TOP(5) C.custid, COUNT(*) AS numorders
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
GROUP BY C.custid;
--QUERY 2
SELECT TOP (5) C.custid, COUNT(O.orderid) AS numorders
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
GROUP BY C.custid;
--QUERY 3
USE TSQLV4;
SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
WHERE O.orderdate >= '20160101';
