/*****************************************************************************************************************

Selected 2 questions from myself and 6 from peers (Nelson D., Gaston K.).

******************************************************************************************************************/

-- Q1: Business User question—Marginal complexity
-- Gaston KASONGO
-- Question: Which are the top ten highly listed products?

SELECT TOP 10 
      p.Name AS ProductName
    , p.ListPrice
FROM Production.Product AS p
ORDER BY p.ListPrice DESC;

-- Q2: Business User question—Marginal complexity
-- Nelson Danso-Abeam
-- Question: How many products are currently marked as finished goods?

SELECT COUNT(*) AS TotalFinishedGoods
FROM Production.Product AS p
WHERE p.FinishedGoodsFlag = 1;

-- Q3: Business User question—Moderate complexity
-- Nelson Danso-Abeam
-- Question: I want to analyze product pricing. Which five products have the highest list price 
-- and what product categories do they belong to?

SELECT TOP 5 
      p.Name AS ProductName
    , p.ListPrice
    , c.Name AS CategoryName
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS sc 
    ON p.ProductSubcategoryID = sc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS c 
    ON sc.ProductCategoryID = c.ProductCategoryID
ORDER BY p.ListPrice DESC;

-- Q4: Business User question—Moderate complexity
-- Gaston KASONGO
-- Question: I am checking on the behavior of the customer. What were the top five customers 
-- in terms of the number of orders they made?

SELECT TOP 5 
      c.CustomerID
    , p.FirstName
    , p.LastName
    , COUNT(soh.SalesOrderID) AS OrderCount
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.Customer AS c 
    ON soh.CustomerID = c.CustomerID
LEFT JOIN Person.Person AS p 
    ON c.PersonID = p.BusinessEntityID
GROUP BY 
      c.CustomerID
    , p.FirstName
    , p.LastName
ORDER BY OrderCount DESC;

-- Q5: Business User question—Increased complexity
-- Jeremy Molero
-- Question: I need a detailed report on our shipping delays. Please provide a list of all sales orders 
-- from 2011 where the ShipDate was later than the DueDate. I need to see the SalesOrderNumber, 
-- the CustomerID, and the number of days the shipment was late, ordered by the longest delay first.

SELECT 
      soh.SalesOrderNumber
    , soh.CustomerID
    , soh.OrderDate
    , soh.DueDate
    , soh.ShipDate
    , DATEDIFF(day, soh.DueDate, soh.ShipDate) AS DaysLate
FROM Sales.SalesOrderHeader AS soh
WHERE soh.ShipDate > soh.DueDate
  AND YEAR(soh.OrderDate) = 2011
ORDER BY DaysLate DESC;

-- Q6: Business User question—Increased complexity
-- Gaston KASONGO
-- Question: The management desires to know international performance. In the case of orders shipped 
-- outside the United States in 2011, what are the total sales, total tax, and freight cost by country?

SELECT 
      t.Name AS Country
    , SUM(soh.TotalDue) AS TotalSales
    , SUM(soh.TaxAmt) AS TotalTax
    , SUM(soh.Freight) AS TotalFreight
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesTerritory AS t 
    ON soh.TerritoryID = t.TerritoryID
WHERE t.CountryRegionCode != 'US'
  AND YEAR(soh.OrderDate) = 2011
GROUP BY t.Name
ORDER BY TotalSales DESC;

-- Q7: Metadata question
-- Jeremy Molero
-- Question: Can you list all the tables in the Production schema that contain a column named Color?

SELECT 
      t.TABLE_SCHEMA
    , t.TABLE_NAME
    , c.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLES AS t
INNER JOIN INFORMATION_SCHEMA.COLUMNS AS c 
    ON t.TABLE_NAME = c.TABLE_NAME 
    AND t.TABLE_SCHEMA = c.TABLE_SCHEMA
WHERE t.TABLE_SCHEMA = 'Production'
  AND c.COLUMN_NAME = 'Color';

-- Q8: Metadata question
-- Nelson Danso-Abeam
-- Question: Which tables in AdventureWorks contain a column named ProductID or ProductSubcategoryID?

SELECT 
      c.TABLE_SCHEMA
    , c.TABLE_NAME
    , c.COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS AS c
WHERE c.COLUMN_NAME IN ('ProductID', 'ProductSubcategoryID')
ORDER BY c.TABLE_NAME, c.COLUMN_NAME;
