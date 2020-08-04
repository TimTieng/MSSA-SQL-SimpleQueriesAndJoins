/*
Class: ISTA 420 - SQL and Application Development
Student: Tim Tieng
Instructor: Christine Lee
Date: 30JUL2020
Description - LAB 2C - SQL 02- Writing and Executing SQL Scripts Part 1
Revised By: Tim Tieng
Revised On: 04AUG2020
Revisions Made:  Changed DB QUERIES from TSQLV4 to NORTHWIND to accurately answer questions.
*/
--Question 1 - What are the Regions?
USE Northwind;
SELECT RegionDescription
FROM dbo.Region;
--Exercise 2: What are the cities?
USE Northwind;
SELECT 
    DISTINCT(C.City)
FROM dbo.Customers AS C 
INNER JOIN dbo.Orders AS O 
    ON C.City = O.ShipCity;
--Exercise 3 - What are the Cities in the Southern Region?    
USE Northwind;
SELECT T.TerritoryDescription, R.RegionDescription
FROM dbo.Territories AS T 
INNER JOIN dbo.Region AS R
    ON t.RegionID = R.RegionID
WHERE R.RegionID = 4;
--Exercise 6: What is the contact name, number and city for each customer 
USE Northwind;
SELECT
    ContactName AS 'Contact Name', Phone, City 
FROM dbo.Customers;
--Exercise 7: What products are currently out of stock?
USE Northwind;
SELECT ProductName, UnitsInStock
FROM dbo.Products 
WHERE UnitsInStock = 0;
--Exercise 8 : What are the 10 Products currently in stock, with the least on hand
USE Northwind;
SELECT 
    TOP (10) ProductName, UnitsInStock
FROM dbo.Products
WHERE UnitsInStock > 0
ORDER BY UnitsInStock ASC;
--Exercise 9: What are the 5 most expensive products in stock?
USE Northwind;
SELECT TOP (5) ProductName, UnitPrice
FROM dbo.Products
WHERE UnitsInStock > 0
--Exercise 10 - How many products, customer and Suppliers does Northwind Have?
USE Northwind;
SELECT
    COUNT(ProductName) AS "Number of Products",
    COUNT(SupplierID) AS 'Number of Suppliers'
FROM dbo.Products;
SELECT COUNT(CustomerID) AS "Number of Customers"
FROM dbo.Customers;