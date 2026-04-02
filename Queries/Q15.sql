-- 15. Identify which products are high-performing, underperforming, or risky by combining sales performance and inventory movement.

WITH product_sales AS (
SELECT oi.product_id,
       SUM(oi.revenue) AS total_revenue,
	   SUM(oi.quantity) AS total_units,
	   MAX(o.order_date) - MIN(o.order_date) AS selling_days
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY oi.product_id
),

metrics AS (
SELECT product_id,
       total_revenue,
	   total_units,
	   ROUND((total_units::numeric / NULLIF(selling_days,0)),2) AS avg_daily_sales
FROM product_sales
),

benchmarks AS (
SELECT AVG(total_revenue) AS avg_revenue,
       AVG(avg_daily_sales) AS avg_velocity
FROM metrics
)

SELECT m.product_id,
       m.total_revenue,
	   m.avg_daily_sales,
	   CASE 
	       WHEN m.total_revenue >= b.avg_revenue AND m.avg_daily_sales >= b.avg_velocity THEN 'Star'
		   WHEN m.total_revenue >= b.avg_revenue AND m.avg_daily_sales < b.avg_velocity THEN 'Cash Cow'
		   WHEN m.total_revenue < b.avg_revenue AND m.avg_daily_sales >= b.avg_velocity THEN 'Growth'
		   ELSE 'Risky'
		END AS product_segment
FROM metrics m
CROSS JOIN benchmarks b;