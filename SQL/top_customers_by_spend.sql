-- Top 5 customers by total campaign spend

SELECT 
    r.CustomerID,
    SUM(r.AmountSpent) AS TotalSpend
FROM responses r
GROUP BY r.CustomerID
ORDER BY TotalSpend DESC
LIMIT 5;
