-- 13. Forecast next period demand for each product using historical sales trends.

WITH monthly_sales AS (
SELECT oi.product_id,
       DATE_TRUNC('month', o.order_date):: date AS month,
	   SUM(oi.quantity) AS total_units
FROM order_items oi
JOIN orders o 
ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY oi.product_id, month
),
lagged AS (
SELECT product_id, 
       month,
	   total_units,
	   LAG(total_units) OVER (PARTITION BY product_id ORDER BY month) AS prev_month_sales
FROM monthly_sales
),
forecast AS (
SELECT product_id,
       month,
	   total_units,
	   prev_month_sales,
	   (total_units - COALESCE(prev_month_sales, total_units)) AS trend,
	   (total_units + (total_units - COALESCE(prev_month_sales, total_units))) AS forecast_next_month
FROM lagged 
)
SELECT product_id,
       month,
	   total_units,
	   prev_month_sales,
	   trend,
	   CASE 
	       WHEN trend > 0 THEN 'Growing'
		   WHEN trend < 0 THEN 'Declining'
		   ELSE 'Stable'
		END AS trend_status,
		forecast_next_month
FROM forecast
ORDER BY product_id, month;