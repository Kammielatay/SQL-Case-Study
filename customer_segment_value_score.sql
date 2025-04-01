USE marketing_analytics;
CREATE VIEW customer_segement_value_score AS 

WITH popular_cte AS (
SELECT Customer_Segment
	, AVG(ROI) AS Avg_ROI
    , AVG(Conversion_Rate) AS Avg_Conversion_Rate
    , AVG(Engagement_Score) AS Avg_Engagement_Score
    , (CASE
		WHEN AVG(ROI) > (SELECT AVG(ROI) FROM marketing_analytics.marketing_campaign_dataset) THEN 1
        ELSE 0
        END) AS Above_Avg_ROI
	, (CASE
		WHEN AVG(Conversion_Rate) > (SELECT AVG(Conversion_Rate) FROM marketing_analytics.marketing_campaign_dataset) THEN 1
        ELSE 0
        END) AS Above_Avg_Conversion_Rate
    , (CASE
		WHEN AVG(Engagement_Score) > (SELECT AVG(Engagement_Score) FROM marketing_analytics.marketing_campaign_dataset) THEN 1
        ELSE 0
        END) AS Above_Avg_Engagement_Score 
FROM marketing_analytics.marketing_campaign_dataset 
GROUP BY Customer_Segment
ORDER BY Customer_Segment DESC
)

SELECT Customer_Segment 
	, ROUND(Avg_ROI, 4) AS Avg_ROI
	, ROUND(Avg_Conversion_Rate,4) AS Avg_Conversion_Rate
    , ROUND(Avg_Engagement_Score) AS Avg_Engagement_Rate
    , CONCAT(Above_Avg_ROI + Above_Avg_Conversion_Rate + Above_Avg_Engagement_Score, "/3") AS Value_Score
FROM popular_cte
ORDER BY Value_Score DESC;
