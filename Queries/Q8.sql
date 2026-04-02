-- 8. Identify what percentage of total revenue is contributed by the top customers and analyze whether the business follows the 80/20 Pareto principle.

WITH customer_revenue AS (
SELECT o.customer_id,
       SUM(oi.revenue) AS total_revenue
FROM orders o 
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY o.customer_id
),

final AS (
SELECT customer_id,
       total_revenue,
	   SUM(total_revenue) OVER (ORDER BY total_revenue DESC) AS cumulative_revenue,
	   SUM(total_revenue) OVER () AS total_revenue_all
FROM customer_revenue
)

SELECT customer_id,
       total_revenue,
	   cumulative_revenue,
	   ROUND(cumulative_revenue * 100.0 / total_revenue_all, 2) AS cumulative_revenue_percentage,
	   CASE 
           WHEN cumulative_revenue * 100.0 / total_revenue_all <= 80 
           THEN 'Top 80% Revenue Customers'
           ELSE 'Remaining Customers'
       END AS segment
FROM final
ORDER BY total_revenue DESC;