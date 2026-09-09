CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE Order_Details (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category)
VALUES
(1, 'Pen', 'Stationery'),
(2, 'Book', 'Stationery'),
(3, 'Laptop', 'Electronics'),
(4, 'Chair', 'Furniture'),
(5, 'Ball', 'Sports');

INSERT INTO Order_Details (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 101, 1, 2),
(2, 101, 3, 1),
(3, 102, 2, 3);

select *from Products
select * from Order_Details

CREATE VIEW Unsold_Items AS
SELECT ProductName, Category
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM Order_Details od
    WHERE p.ProductID = od.ProductID
);

select *from Unsold_Items
