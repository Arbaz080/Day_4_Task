SELECT 
   FirstName,
   LastName, 
   City,
   country
FROM 
   Customers 
WHERE 
   Country = 'India' 
ORDER BY City;


SELECT 
   CategoryID, 
   SUM(Price * Stock) AS InventoryValue
FROM 
   Products
GROUP BY CategoryID;


SELECT 
   c.FirstName, 
   c.LastName, 
   p.ProductName, 
   od.Quantity
FROM 
   Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID;


SELECT 
   ProductName, 
   Price
FROM 
   Products
WHERE Price > (SELECT AVG(Price) FROM Products);


CREATE VIEW CustomerOrders AS
SELECT 
   c.FirstName, 
   c.LastName, 
   o.OrderID, 
   o.OrderDate, 
   SUM(od.Quantity * p.Price) AS OrderTotal
FROM 
   Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY
   c.FirstName, 
   c.LastName, 
   o.OrderID, 
   o.OrderDate;


SELECT *
FROM CustomerOrders;