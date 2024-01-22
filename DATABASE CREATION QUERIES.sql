-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200)
);
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
    (1, 'John', 'Doe', 'john@example.com', '123-456-7890', '123 Main St'),
    (2, 'Jane', 'Smith', 'jane@example.com', '555-123-4567', '456 Elm St'),
    (3, 'Michael', 'Johnson', 'michael@example.com', '789-555-1234', '789 Oak Ave'),
    (4, 'Emily', 'Williams', 'emily@example.com', '987-654-3210', '567 Pine Rd'),
    (5, 'David', 'Brown', 'david@example.com', '111-222-3333', '890 Maple Ln'),
    (6, 'Sarah', 'Miller', 'sarah@example.com', '444-555-6666', '234 Cedar St'),
    (7, 'William', 'Jones', 'william@example.com', '777-888-9999', '345 Birch Rd'),
    (8, 'Olivia', 'Davis', 'olivia@example.com', '222-333-4444', '456 Walnut Ave'),
    (9, 'Daniel', 'Wilson', 'daniel@example.com', '555-444-3333', '567 Pine Rd'),
    (10, 'Sophia', 'Martinez', 'sophia@example.com', '888-999-0000', '678 Oak Ave');

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Description TEXT,
    StockQuantity INT
);

-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, Description, StockQuantity)
VALUES
    (1, 'Men''s T-Shirt', 'Clothing', 19.99, 'Comfortable cotton t-shirt for men', 100),
    (2, 'Women''s Dress', 'Clothing', 39.99, 'Elegant evening dress for women', 50),
    (3, 'Running Shoes', 'Footwear', 59.99, 'High-performance running shoes', 75),
    (4, 'Leather Jacket', 'Clothing', 129.99, 'Classic leather jacket for men', 25),
    (5, 'Casual Sneakers', 'Footwear', 34.99, 'Stylish sneakers for everyday wear', 120),
    (6, 'Formal Suit', 'Clothing', 199.99, 'Sharp formal suit for special occasions', 30),
    (7, 'Summer Dress', 'Clothing', 29.99, 'Light and breezy dress for summer', 80),
    (8, 'Backpack', 'Accessories', 49.99, 'Durable and spacious backpack', 60),
    (9, 'Wristwatch', 'Accessories', 79.99, 'Elegant wristwatch with leather strap', 45),
    (10, 'Sunglasses', 'Accessories', 24.99, 'Trendy sunglasses with UV protection', 90);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-08-01', 59.98),
    (2, 2, '2023-08-02', 79.98),
    (3, 3, '2023-08-03', 32.50),
    (4, 1, '2023-08-04', 45.75),
    (5, 4, '2023-08-05', 27.30),
    (6, 5, '2023-08-06', 19.99),
    (7, 2, '2023-08-07', 88.50),
    (8, 6, '2023-08-08', 62.00),
    (9, 7, '2023-08-09', 40.25),
    (10, 3, '2023-08-10', 75.20);
    

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 1),
    (3, 2, 3, 3),
    (4, 2, 1, 1),
    (5, 3, 2, 2),
    (6, 3, 4, 1),
    (7, 4, 5, 2),
    (8, 4, 1, 1),
    (9, 5, 6, 3),
    (10, 5, 7, 2);

-- Create the Reviews table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment, ReviewDate)
VALUES
    (1, 1, 1, 4, 'Great fit and comfortable fabric', '2023-08-03'),
    (2, 2, 2, 5, 'Absolutely stunning dress!', '2023-08-04'),
    (3, 5, 3, 3, 'The color of the shirt faded after a few washes.', '2023-08-07'),
    (4, 8, 9, 5, 'Great quality backpack, lots of compartments.', '2023-08-08'),
    (5, 6, 1, 2, 'The fabric of the jeans feels cheap and uncomfortable.', '2023-08-09'),
    (6, 1, 4, 4, 'Nice fit and design for the price.', '2023-08-10'),
    (7, 4, 10, 1, 'The stitching of the blouse started coming undone.', '2023-08-11'),
    (8, 9, 2, 5, 'Im impressed with the quick delivery and quality', '2023-08-12'),
    (9, 7, 8, 3, 'The hoodie is warm but shrunk after washing.', '2023-08-13'),
    (10, 10, 6, 5, 'The sunglasses are stylish and provide good UV protection.', '2023-08-14');
    
