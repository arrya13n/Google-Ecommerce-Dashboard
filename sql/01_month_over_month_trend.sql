-- Monthly ecommerce performance trend
-- Dataset: data-to-insights.ecommerce.all_sessions
#standardSQL

SELECT
  DATE_TRUNC(PARSE_DATE('%Y%m%d', date), MONTH) AS month_date,
  FORMAT_DATE('%Y-%m', PARSE_DATE('%Y%m%d', date)) AS month,
  COUNT(DISTINCT CONCAT(fullVisitorId, '-', CAST(visitId AS STRING))) AS total_sessions,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors,
  COUNT(DISTINCT transactionId) AS total_transactions,
  ROUND(SUM(IFNULL(transactionRevenue, 0)) / 1000000, 2) AS total_revenue,
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT transactionId),
      COUNT(DISTINCT CONCAT(fullVisitorId, '-', CAST(visitId AS STRING)))
    ) * 100,
    2
  ) AS conversion_rate_pct
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY month_date, month
ORDER BY month_date;
