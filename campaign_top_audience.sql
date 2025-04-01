WITH top_audience_by_campaign_cte AS (
	SELECT 
	Campaign_Type
    , Target_Audience
    , AVG(Conversion_Rate) AS Avg_Conversion_Rate
    , ROW_NUMBER() OVER (Partition BY Campaign_Type ORDER BY AVG(Conversion_Rate) DESC) AS Highest_Converion_Rate
FROM marketing_analytics.marketing_campaign_dataset
GROUP BY Target_Audience, Campaign_Type
ORDER BY Campaign_Type DESC
)

SELECT 
	Campaign_Type
    , Target_Audience
    , Avg_Conversion_Rate
FROM top_audience_by_campaign_cte
WHERE Highest_Converion_Rate = 1

