-- High-view products that fail to convert into orders
#standardSQL

WITH product_metrics AS (
  SELECT
    v2ProductName AS product_name,
    v2ProductCategory AS product_category,
    COUNT(*) AS product_views,
    COUNT(productQuantity) AS order_events,
    SUM(productQuantity) AS total_units_ordered,
    ROUND(SUM(IFNULL(productRevenue, 0)) / 1000000, 2) AS product_revenue,
    SAFE_DIVIDE(COUNT(productQuantity), COUNT(*)) AS view_to_order_rate
  FROM `data-to-insights.ecommerce.all_sessions`
  WHERE type = 'PAGE'
    AND v2ProductName IS NOT NULL
  GROUP BY product_name, product_category
)

SELECT
  product_name,
  product_category,
  product_views,
  order_events,
  total_units_ordered,
  product_revenue,
  ROUND(view_to_order_rate * 100, 2) AS view_to_order_rate_pct
FROM product_metrics
WHERE product_views >= 100
ORDER BY product_views DESC
LIMIT 100;
