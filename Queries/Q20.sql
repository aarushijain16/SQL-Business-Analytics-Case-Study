-- 20. Analyze revenue trends over time and measure volatility to understand business stability and predictability.

WITH monthly_revenue AS (
SELECT DATE_TRUNC('month', o.order_date)::date AS month,
       SUM(oi.revenue) AS total_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY month
),

stats AS (
SELECT AVG(total_revenue) AS avg_revenue,
       STDDEV(total_revenue) AS revenue_stddev
FROM monthly_revenue
),

final AS (
SELECT m.month,
       m.total_revenue,
	   s.avg_revenue,
	   s.revenue_stddev,
	   (s.revenue_stddev / NULLIF(s.avg_revenue,0)) AS volatility_ratio
FROM monthly_revenue m
CROSS JOIN stats s
)

SELECT month, 
       total_revenue,
	   ROUND(avg_revenue,2) AS avg_revenue,
	   ROUND(revenue_stddev,2) AS revenue_stddev,
	   ROUND(volatility_ratio,2) AS volatility_ratio,
	   CASE 
	       WHEN volatility_ratio < 0.2 THEN 'Stable'
		   WHEN volatility_ratio < 0.5 THEN 'Moderate'
		   ELSE 'Highly Volatile'
		END AS stability_status
FROM final
ORDER BY month;