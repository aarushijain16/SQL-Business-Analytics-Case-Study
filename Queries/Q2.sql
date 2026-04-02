-- 2. Calculate the daily revenue and cumulative (running) revenue over time.

WITH total_revenue AS (
SELECT o.order_date,
	   SUM(oi.revenue) AS daily_revenue
FROM orders o 
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date   
)

SELECT order_date, 
	   daily_revenue,
	   SUM(daily_revenue) OVER (ORDER BY order_date) AS cumulative_revenue
FROM total_revenue
ORDER BY order_date;

