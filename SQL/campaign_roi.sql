-- ROI per campaign = (Revenue - Cost) / Cost

SELECT 
    c.CampaignID,
    c.CampaignType,
    c.Channel,
    c.Cost,
    COALESCE(SUM(r.AmountSpent), 0) AS Revenue,
    ROUND(
        CASE 
            WHEN c.Cost = 0 THEN NULL
            ELSE (SUM(r.AmountSpent) - c.Cost) * 1.0 / c.Cost 
        END, 2
    ) AS ROI
FROM campaigns c
LEFT JOIN responses r ON c.CampaignID = r.CampaignID
GROUP BY c.CampaignID, c.CampaignType, c.Channel, c.Cost
ORDER BY ROI DESC;
