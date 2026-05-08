-- Top products by units ordered
#standardSQL

SELECT
  v2ProductName AS product_name,
  v2ProductCategory AS product_category,
  COUNT(*) AS product_views,
  COUNT(productQuantity) AS order_events,
  SUM(productQuantity) AS total_units_ordered,
  ROUND(SUM(IFNULL(productRevenue, 0)) / 1000000, 2) AS product_revenue
FROM `data-to-insights.ecommerce.all_sessions`
WHERE type = 'PAGE'
  AND v2ProductName IS NOT NULL
GROUP BY product_name, product_category
HAVING total_units_ordered IS NOT NULL
ORDER BY total_units_ordered DESC
LIMIT 10;
