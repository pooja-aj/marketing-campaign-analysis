-- ROI by campaign type

SELECT 
    c.CampaignType,
    COUNT(DISTINCT c.CampaignID) AS TotalCampaigns,
    COALESCE(SUM(r.AmountSpent), 0) AS TotalRevenue,
    SUM(c.Cost) AS TotalCost,
    ROUND(
        CASE 
            WHEN SUM(c.Cost) = 0 THEN NULL
            ELSE (SUM(r.AmountSpent) - SUM(c.Cost)) * 1.0 / SUM(c.Cost)
        END, 2
    ) AS ROI
FROM campaigns c
LEFT JOIN responses r ON c.CampaignID = r.CampaignID
GROUP BY c.CampaignType
ORDER BY ROI DESC;
