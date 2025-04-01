USE marketing_analytics;
CREATE VIEW campaign_roi_summary AS
    SELECT 
        Campaign_Type AS Campaigns,
        COUNT(Campaign_Type) AS `Num of Campaigns`,
        AVG(ROI) AS `Avg. ROI`
    FROM
        marketing_analytics.marketing_campaign_dataset
    GROUP BY Campaign_Type
    ORDER BY AVG(ROI) DESC;
