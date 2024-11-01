CREATE PROCEDURE GetCustomerSales
AS
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName,
           SUM(od.Quantity * od.UnitPrice) AS TotalSales
    FROM Customerdata c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.Status = 'Completed'
    GROUP BY c.CustomerID, c.FirstName, c.LastName;
END;
EXEC GetCustomerSales;
