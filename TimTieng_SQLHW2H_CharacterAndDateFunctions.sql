/*
Class: ISTA 420 SQL and Application Development
Student: Tim Tieng
Instructor: Christine Lee
Date: 15JUL2020
Description: SQL Homework 2H- Character and Date Functions
Revised On:
Revised By:
Revision Description:
*/
--Task 1 Mailing Labels
USE Northwind;

SELECT
    ContactTitle AS 'Job Title',
    ContactName AS 'Contact Name',
    CompanyName AS 'Company Name',
    Address,
    City,
    Region,
    PostalCode AS 'Postal Code',
    Country
FROM dbo.Customers
ORDER BY ContactTitle ASC;
--Task 2: Telephone Book
USE Northwind;

SELECT
    ContactName AS 'Contact Name',
    CompanyName AS 'Company Name',
    Phone
FROM dbo.Customers;
--Task 3: Shipping Lag Report
USE Northwind;

SELECT
    OrderID AS 'Order Reference Number',
    OrderDate AS 'Date Order Placed',
    ShippedDate AS 'Date Order Shipped',
    DATEDIFF_BIG(DAY, OrderDate, ShippedDate) AS 'Difference in Days'
FROM dbo.Orders
ORDER BY [Difference in Days] DESC;
--Task 4 - Birthday Age
SELECT
    DATEDIFF_BIG(SECOND, '19890212', '20200715') AS 'Tim Age in Seconds',
    DATEDIFF_BIG(MINUTE, '19890212', '20200715') AS 'Tim Age in Minutes',
    DATEDIFF_BIG(DAY, '19890212','20200715') AS 'Tim Age in Days',
    DATEDIFF_BIG(WEEK, '19890212', '20200715') AS 'Tim Age in Weeks',
    DATEDIFF_BIG(MONTH, '19890212', '20200715') AS 'Tim Age in Months',
    DATEDIFF_BIG(YEAR, '19890212', '20200716') AS 'Tim Age in Years';
/* 
REFERENCES- ALL WORK WAS COMPLETED WITHOUT ASSISTANCE UNLESS OTHERWISE LISTED BELOW:

1. I used this link to dertmine how to merge my query results to create mailing shipping labels for A8160 Avery labels.
   https://support.microsoft.com/en-us/office/use-a-table-or-query-as-a-mail-merge-data-source-860ef4bc-e793-4004-8a1b-5c8a34c7e89d

2. I used w3Schools - SQL Server DATEDIFF() function lessons to draft my queries for task 4
   https://www.w3schools.com/sql/func_sqlserver_datediff.asp 
*/