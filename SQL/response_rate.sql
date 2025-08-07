SELECT 
    COUNT(DISTINCT c.CustomerID) AS TotalCustomers,
    COUNT(DISTINCT r.CustomerID) AS RespondedCustomers,
    ROUND(COUNT(DISTINCT r.CustomerID) * 100.0 / COUNT(DISTINCT c.CustomerID), 2) AS ResponseRatePercent
FROM customers c
LEFT JOIN responses r ON c.CustomerID = r.CustomerID;
