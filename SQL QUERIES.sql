USE ap;
-- Retrieves customer names and email addresses of those who have made orders, ordered by their last name
SELECT FirstName, LastName, Email
FROM Customers
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Orders)
ORDER BY LastName;

-- Retrieves order details including product name and quantity for each order
SELECT Orders.OrderID, Products.ProductName, OrderDetails.Quantity
FROM Orders
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID;

-- Inserting a new customer into the Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (15, 'Billy', 'Lake', 'billy@example.com', '555-987-6543', '789 Oak St');

-- Calculates the total amount spent by each customer
SELECT Customers.CustomerID, FirstName, LastName, SUM(TotalAmount) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, FirstName, LastName;

-- Retrieves product names and their average rating from reviews
SELECT ProductName, (
    SELECT AVG(Rating)
    FROM Reviews
    WHERE Reviews.ProductID = Products.ProductID
) AS AvgRating
FROM Products;





