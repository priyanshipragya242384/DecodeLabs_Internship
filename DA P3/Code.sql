CREATE DATABASE SalesDB;

USE SalesDB;

CREATE TABLE Orders (
    OrderID VARCHAR(20),
    CustomerID VARCHAR(20),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    OrderDate DATE,
    OrderStatus VARCHAR(20)
);

LOAD DATA INFILE '"C:\Users\Dell\Downloads\dataset for Data analysis(2).csv"'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT *
FROM Orders;


SELECT OrderID,
       Product,
       TotalPrice
FROM Orders;


SELECT OrderID,
       Product,
       TotalPrice
FROM Orders
WHERE OrderStatus = 'Delivered';

SELECT OrderID,
       Product,
       TotalPrice
FROM Orders
ORDER BY TotalPrice DESC;


SELECT COUNT(*) AS Total_Orders
FROM Orders;


SELECT SUM(TotalPrice) AS Total_Revenue
FROM Orders;

SELECT AVG(TotalPrice) AS Average_Order_Value
FROM Orders;


SELECT Product,
       COUNT(*) AS Number_of_Orders
FROM Orders
GROUP BY Product;



SELECT Product,
       SUM(TotalPrice) AS Total_Sales
FROM Orders
GROUP BY Product
ORDER BY Total_Sales DESC;


SELECT Product,
       AVG(TotalPrice) AS Average_Sale
FROM Orders
GROUP BY Product;

SELECT
    COUNT(*) AS Total_Orders,
    SUM(TotalPrice) AS Total_Revenue,
    AVG(TotalPrice) AS Average_Order_Value
FROM Orders;
