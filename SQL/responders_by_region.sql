-- Response count by region

SELECT 
    cu.Region,
    COUNT(DISTINCT r.CustomerID) AS Responders
FROM customers cu
JOIN responses r ON cu.CustomerID = r.CustomerID
GROUP BY cu.Region
ORDER BY Responders DESC;
