-- Average spend per campaign (only from responders)

SELECT 
    c.CampaignID,
    c.CampaignType,
    c.Channel,
    COUNT(DISTINCT r.CustomerID) AS Responders,
    SUM(r.AmountSpent) AS TotalSpend,
    ROUND(AVG(r.AmountSpent), 2) AS AvgSpendPerResponder
FROM campaigns c
JOIN responses r ON c.CampaignID = r.CampaignID
GROUP BY c.CampaignID, c.CampaignType, c.Channel
ORDER BY AvgSpendPerResponder DESC;
