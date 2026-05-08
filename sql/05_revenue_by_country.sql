-- Revenue by country
#standardSQL

SELECT
  country,
  COUNT(DISTINCT CONCAT(fullVisitorId, '-', CAST(visitId AS STRING))) AS total_sessions,
  COUNT(DISTINCT transactionId) AS total_transactions,
  ROUND(SUM(IFNULL(transactionRevenue, 0)) / 1000000, 2) AS total_revenue,
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT transactionId),
      COUNT(DISTINCT CONCAT(fullVisitorId, '-', CAST(visitId AS STRING)))
    ) * 100,
    2
  ) AS conversion_rate_pct,
  ROUND(
    SAFE_DIVIDE(
      SUM(IFNULL(transactionRevenue, 0)) / 1000000,
      COUNT(DISTINCT CONCAT(fullVisitorId, '-', CAST(visitId AS STRING)))
    ),
    2
  ) AS revenue_per_session
FROM `data-to-insights.ecommerce.all_sessions`
WHERE country IS NOT NULL
GROUP BY country
HAVING total_revenue > 0
ORDER BY total_revenue DESC;
