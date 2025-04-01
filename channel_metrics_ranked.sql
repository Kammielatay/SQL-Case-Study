USE marketing_analytics;
CREATE VIEW channel_metrics_ranked AS

SELECT Channel_Used
	, COUNT(*)
	, AVG(ROI)
    , RANK() OVER (ORDER BY AVG(ROI) DESC) AS Highest_ROI
    , AVG(Conversion_Rate)
    , RANK() OVER (ORDER BY AVG(Conversion_Rate) DESC) AS Highest_Conversion_Rate
    , AVG(Engagement_Score)
    , RANK() OVER (ORDER BY AVG(Engagement_Score) DESC) AS Highest_Engagement_Score
FROM marketing_analytics.marketing_campaign_dataset
GROUP BY Channel_Used
ORDER BY Channel_Used DESC
