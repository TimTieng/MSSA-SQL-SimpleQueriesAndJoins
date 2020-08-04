/*
Class: ISTA 420 - SQL and Application Development
Student: Tim Tieng
Instructor: Christine Lee
Date: 03AUG2020
Description: LAB 2D -SQL 02- Writing and Executing SQL Scripts Part II
Notes: PLEASE NOTE that to complete this assignment, I had to use Northwind vs TSQLV4. 
YOU MAY NEED TO REPLACE MY USE STATEMENTS WITH TSQLV4 .
Revised By:
Revised On:
Revisions Made: 
*/
--Question 1: Who are our customers in North America?
USE Northwind;
SELECT
    ContactName, CompanyName, Country 
FROM dbo.Customers
WHERE Country = 'USA';
--Question 2: What orders were placed in April 1998?
USE Northwind;
SELECT 
    O.OrderID, O.CustomerID, O.OrderDate, C.ContactName
FROM dbo.Orders AS O 
INNER JOIN dbo.Customers AS C 
    ON O.CustomerID = C.CustomerID
WHERE O.OrderDate > '19980401' AND O.OrderDate <= '19980430';
--Question 3: What sauces do we sell?
USE Northwind;
SELECT ProductName 
FROM dbo.Products
WHERE ProductName LIKE '%sauce%';
--Question 4: Find the name of a product name that has "Dried Fruit" in the name
USE Northwind; 
SELECT ProductName
FROM dbo.Products
WHERE ProductName LIKE '%dried%';
--Question 5: What employees ship products to Germany in December?
USE Northwind;
SELECT 
    E.EmployeeID, E.LastName, E.FirstName, ET.TerritoryID, T.TerritoryDescription
FROM dbo.Employees AS E 
INNER JOIN dbo.EmployeeTerritories AS ET 
    ON E.EmployeeID = ET.EmployeeID
    LEFT JOIN dbo.Territories AS T 
    ON ET.TerritoryID = T.TerritoryID;
--Query Above does not answer question, New one required (Below) ASSISTANCE RECIEVED FROM Hayden Barnes
USE Northwind;
SELECT O.EmployeeID, E.LastName, E.FirstName,O.ShipCountry, O.ShippedDate
FROM dbo.Orders AS O 
INNER JOIN dbo.Employees AS E
    ON O.EmployeeID = E.EmployeeID
WHERE ShipCountry = 'Germany' AND MONTH(ShippedDate) = 12;
--Question 6: What is the total amount and the Net Amount of all orders for Product 19 where a Customer took a discount?
USE Northwind;
SELECT 
    P.ProductID, P.ProductName, P.UnitsInStock, P.UnitsOnOrder, OD.Quantity, OD.Discount
FROM dbo.Products AS P 
INNER JOIN dbo.[Order Details] AS OD 
    ON P.ProductID = OD.ProductID
WHERE OD.Discount != 0 AND P.ProductID = 19;
--Question 7: Provide a lsit of employees by title, first name, last name. Put position under the names for each employee
USE Northwind; 
SELECT
    LastName, FirstName, Title 
FROM dbo.Employees;
--Question 8: Provide a List of our customers and the first name only of the customer Rep.
USE Northwind;
SELECT 
    C.ContactName AS "Customer Name", E.FirstName AS "Company Representative First Name"
FROM dbo.Customers AS C 
INNER JOIN dbo.Orders AS O 
    ON O.CustomerID = C.CustomerID
LEFT JOIN dbo.Employees AS E 
    ON O.EmployeeID = E.EmployeeID;
--Question 9: Provide a list of Customer contact alphabetically by last name
USE Northwind;
SELECT
    ContactName
FROM dbo.Customers
ORDER BY ContactName ASC;
-- The results in a column with both first name and last name (Above), new query needed (Below)
DECLARE @delimeter VARCHAR(50)
SET @delimeter= ' '
;WITH CTE AS
(
    SELECT 
        [CustomerID], 
        [Contactname], 
        [Companyname], 
        [Phone],
        CAST('<M>' + REPLACE(Contactname, @delimeter, '</M><M>')+ '</M>' AS XML)
        AS [Contactname XML]
    FROM dbo.Customers
)

SELECT 
    [Contactname XML]. value('/M[1]', 'varchar(50)') AS Firstname,
    [Contactname XML]. value('/M[2]', 'varchar(50)') AS Lastname,
    [Contactname XML]. value('/M[3]', 'varchar(50)') AS Middlename,
    [Phone], 
    [CompanyName]

FROM CTE

ORDER BY Lastname, Firstname, Middlename, CompanyName, Phone 
GO
--Question 10: How old am I in Days ?
SELECT DATEDIFF_BIG(DAY, '19890212', GETDATE()) AS "Tim's Age in Days";