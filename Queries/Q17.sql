-- 17. Analyze how different price ranges impact sales volume and revenue to understand price sensitivity and optimize pricing strategy.

WITH price_analysis AS (
SELECT p.category,
       CASE 
	       WHEN p.price < 1000 THEN 'Low'
		   WHEN p.price BETWEEN 1000 AND 2000 THEN 'Medium'
		   ELSE 'High'
		END AS price_band,
	   SUM(oi.quantity) AS total_units,
	   SUM(oi.revenue) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category, price_band
)

SELECT category,
       price_band,
	   total_units,
	   total_revenue,
	   ROUND(total_revenue::numeric / NULLIF(total_units,0),2) AS avg_selling_price,
	   ROUND(total_units * 100.0 / SUM(total_units) OVER(),2) AS volume_share_percent,
	   ROUND(total_revenue * 100.0 / SUM(total_revenue) OVER(),2) AS revenue_share_percent
FROM price_analysis
ORDER BY category, price_band;