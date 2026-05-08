-- Channel performance analysis
-- Which traffic channels drive traffic, purchases, revenue, conversion, and session value?
#standardSQL

WITH channel_sessions AS (
  SELECT
    channelGrouping AS traffic_channel,
    CONCAT(fullVisitorId, '-', CAST(visitId AS STRING)) AS session_id,
    MAX(CASE WHEN transactionId IS NOT NULL THEN 1 ELSE 0 END) AS purchased,
    SUM(IFNULL(transactionRevenue, 0)) / 1000000 AS session_revenue
  FROM `data-to-insights.ecommerce.all_sessions`
  GROUP BY traffic_channel, session_id
)

SELECT
  traffic_channel,
  COUNT(*) AS total_sessions,
  SUM(purchased) AS total_purchases,
  ROUND(SUM(session_revenue), 2) AS total_revenue,
  ROUND(SAFE_DIVIDE(SUM(purchased), COUNT(*)) * 100, 2) AS conversion_rate_pct,
  ROUND(SAFE_DIVIDE(SUM(session_revenue), COUNT(*)), 2) AS revenue_per_session,
  ROUND(SAFE_DIVIDE(SUM(session_revenue), SUM(purchased)), 2) AS average_order_value
FROM channel_sessions
GROUP BY traffic_channel
ORDER BY total_revenue DESC;
